#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ArduinoOTA.h>

#define FASTLED_ESP8266_RAW_PIN_ORDER
#include <FastLED.h>
#include <PubSubClient.h>
#include <Bounce2.h>

#include "config.h"

extern "C" {
#include "user_interface.h"
}

#define LED_ON 1
#define LED_OFF 2

uint8_t outdoor_led_brightness = 100;
uint8_t indoor_led_brightness = 100;
volatile uint8_t outdoor_hue = 0;
CRGB outdoor_leds[OUTDOOR_LED_COUNT];
volatile short outdoor_timer_active = 0;
volatile short outdoor_led_status = LED_OFF;

volatile unsigned short door_status = 100;
volatile unsigned short led_update = 0;

WiFiClient espClient;
PubSubClient client(espClient);
WiFiServer server(80);
Bounce door = Bounce();

os_timer_t Timer1;

void outdoor_led_clear() {
  for (int i = 0; i <= OUTDOOR_LED_COUNT; i++) {
    outdoor_leds[i] = CRGB(0,0,0);
  }
}

void timerCall(void*z) {
  if (outdoor_led_status == LED_ON) {
    if (outdoor_timer_active == 0) {
      outdoor_led_clear();
      outdoor_led_status = LED_OFF;
    }
    else {
      fill_rainbow(outdoor_leds, OUTDOOR_LED_COUNT, outdoor_hue++, 5);
      outdoor_timer_active--;
    }
    led_update = 1;
  }
}

void setup_timer1(void) {
  os_timer_setfn(&Timer1, timerCall, NULL);
  os_timer_arm(&Timer1, 1000, true);
}

void wificonnect() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(SECRET_SSID, SECRET_PASS);
  while (WiFi.status() != WL_CONNECTED) {
    delay(200);
  }
}

void setup() {
  pinMode(DOOR_REED_CONTACT_PIN, INPUT_PULLUP);
  door.attach(DOOR_REED_CONTACT_PIN);
  door.interval(250);

  FastLED.addLeds<NEOPIXEL, OUTDOOR_LED_PIN>(outdoor_leds, OUTDOOR_LED_COUNT);
  FastLED.setBrightness(outdoor_led_brightness);

  setup_timer1();
  wificonnect();

  client.setServer(MQTT_SERVER, 1883);
  client.connect("door", MQTT_USERNAME, MQTT_PASSWORD);
  server.begin();

  outdoor_led_clear();
  FastLED.show();
}

void send_door_status(uint8_t door_status) {
  if (door_status == 1) {
    client.publish("/door/state", "OPEN");
  }
  else {
    client.publish("/door/state", "CLOSED");
  }
}

void loop() {
  if (WiFi.status() != WL_CONNECTED) {
    wificonnect();
  }
  ArduinoOTA.handle();
  door.update();

  if (led_update == 1) {
    FastLED.show();
    led_update = 0;
  }

  short current_door_status = door.read();

  // door is opened and door was closed before
  if (current_door_status == HIGH && door_status != 1) {
    // enable LEDs first
    if (outdoor_led_status == LED_OFF) {
      fill_rainbow(outdoor_leds, OUTDOOR_LED_COUNT, outdoor_hue++, 5);
      FastLED.show();
      outdoor_led_status = LED_ON;
      outdoor_timer_active = 60;
    }
  
    // send status to OpenHAB2
    send_door_status(1);
    door_status = 1;
  }

  if (current_door_status == LOW && door_status != 0) {
    send_door_status(0);
    door_status = 0;
  }

  if (current_door_status == HIGH) {
      outdoor_timer_active = 60;
  }
}
