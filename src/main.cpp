#include <Arduino.h>
#include <WiFi.h>
#include <ArduinoOTA.h>

#include <FastLED.h>
#include <PubSubClient.h>
#include <Bounce2.h>

#include "config.h"

#define PIN_LED_OUTDOOR 16
#define PIN_LED_INDOOR 17
#define PIN_ENABLE_LEDS_BUTTONS 18  // LED in the big push buttons?
#define PIN_DOOR_REED_CONTACT 34 // external pullup  
#define PIN_BUTTON_ALL_LIGHTS_OFF 35 // external pullup
#define PIN_BUTTON_SWITCH_LIGHT_ON 36 // external pullup
#define PIN_DOOR_SEALED 39 // external pullup // TLE4913 inside lock
#define PIN_BUZZER 1 // FIXME: Buzzer meldet wenn tür abgeschlossen wird

#define LED_ON 1
#define LED_OFF 2
#define LED_OPENHAB 3

#define OUTDOOR_LED_COUNT 52
#define INDOOR_LED_COUNT 57

#define LED_MODE_NOTHING 0
#define LED_MODE_RAINBOW 1
#define LED_MODE_SIMPLE_COLOR 2

uint8_t outdoor_led_brightness = 40;
volatile uint8_t outdoor_hue = 0;
CRGB outdoor_leds[OUTDOOR_LED_COUNT];

uint8_t indoor_led_brightness = 100;
volatile uint8_t indoor_hue = 0;
CRGB indoor_leds[INDOOR_LED_COUNT];

volatile short outdoor_timer_active = 0;
volatile short indoor_timer_active = 0;
volatile short outdoor_led_status = LED_OFF;
volatile short indoor_led_status = LED_OFF;

volatile short indoor_led_mode = LED_MODE_NOTHING;

volatile unsigned short door_status = 100;
volatile unsigned short led_update = 0;

WiFiClient espClient;
PubSubClient client(espClient);
Bounce door = Bounce();
Bounce button_all_lights_off = Bounce();
Bounce button_switch_light_on = Bounce();
Bounce door_sealed = Bounce();
hw_timer_t * timer1 = NULL;

void led_show() {
  FastLED[0].showLeds(outdoor_led_brightness);
  FastLED[1].showLeds(indoor_led_brightness);
}

void outdoor_led_clear() {
  fill_solid(outdoor_leds, OUTDOOR_LED_COUNT, CRGB::Black);
}

void indoor_led_clear() {
  fill_solid(indoor_leds, INDOOR_LED_COUNT, CRGB::Black);
}

void mqtt_callback(char* topic, byte* payload, unsigned int len) {
  if (len > 19 ) {
    // we will never send messages > 19
    return;
  }
  char message_payload[20] = "";
  for (unsigned int i = 0; i < len; i++) {
    message_payload[i] = payload[i];
  }
  String messageString = String(message_payload);

  int index_state = messageString.indexOf(",");
  int index_red = messageString.indexOf(",", index_state + 1);
  int index_green = messageString.indexOf(",", index_red + 1);
  int index_blue = messageString.indexOf(",", index_green + 1);
  int index_bright = messageString.indexOf(",", index_blue + 1);

  int value_state = messageString.substring(0, index_state).toInt();
  int value_red = messageString.substring(index_state + 1, index_red).toInt();
  int value_green = messageString.substring(index_red + 1, index_green).toInt();
  int value_blue = messageString.substring(index_green + 1, index_blue).toInt();
  int value_bright = messageString.substring(index_blue + 1, index_bright).toInt();
  int value_rain = messageString.substring(index_bright + 1).toInt();

  indoor_led_brightness = map(value_bright, 0, 100, 0, 255);

  if (value_state == 0) {
    indoor_led_status = LED_OFF;
    indoor_led_clear();
    led_update = 1;
    return;
  }
  if (value_rain == 1) {
    indoor_led_mode = LED_MODE_RAINBOW;
    fill_rainbow(indoor_leds, INDOOR_LED_COUNT, indoor_hue++, 5);
  }
  else {
    CRGB color = CRGB(value_red, value_green, value_blue);
    indoor_led_mode = LED_MODE_SIMPLE_COLOR;
    fill_solid(indoor_leds, INDOOR_LED_COUNT, color);
  }
  led_show();

  indoor_led_status = LED_OPENHAB;
  led_update = 1;
}

void IRAM_ATTR timerCall() {
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
  if (indoor_led_status == LED_ON) {
    if (indoor_timer_active == 0) {
      indoor_led_clear();
      indoor_led_status = LED_OFF;
    }
    else {
      fill_rainbow(indoor_leds, INDOOR_LED_COUNT, indoor_hue++, 5);
      indoor_timer_active--;
    }
    led_update = 1;
  }
  if (indoor_led_status == LED_OPENHAB && indoor_led_mode == LED_MODE_RAINBOW) {
    fill_rainbow(indoor_leds, INDOOR_LED_COUNT, indoor_hue++, 5);
    led_update = 1;
  }
}

void setup_timer1(void) {
  timer1 = timerBegin(0, 80, true);
  timerAttachInterrupt(timer1, &timerCall, true);
  timerAlarmWrite(timer1, 20 * 1000, true);
}

void wificonnect() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(SECRET_SSID, SECRET_PASS);
  while (WiFi.status() != WL_CONNECTED) {
    delay(200);
  }
  client.connect("door-esp32", MQTT_USERNAME, MQTT_PASSWORD);
  client.subscribe("indoor_led/state");
}

void send_door_status(uint8_t door_status) {
  if (door_status == 1) {
    client.publish("/door/state", "OPEN");
  }
  else {
    client.publish("/door/state", "CLOSED");
  }
}

void setup() {
  Serial.begin(115200);
  setCpuFrequencyMhz(80);
  WiFi.setHostname("door-system");

  // reed contact above the door
  pinMode(PIN_DOOR_REED_CONTACT, INPUT);
  door.attach(PIN_DOOR_REED_CONTACT);
  door.interval(250);

  // push button
  pinMode(PIN_BUTTON_ALL_LIGHTS_OFF, INPUT);
  button_all_lights_off.attach(PIN_BUTTON_ALL_LIGHTS_OFF);
  button_all_lights_off.interval(10);

  // push button
  pinMode(PIN_BUTTON_SWITCH_LIGHT_ON, INPUT);
  button_switch_light_on.attach(PIN_BUTTON_SWITCH_LIGHT_ON);
  button_switch_light_on.interval(10);

  // TLE4913 hall sensor with open drain
  pinMode(PIN_DOOR_SEALED, INPUT);
  door_sealed.attach(PIN_DOOR_SEALED);
  door_sealed.interval(100);

  // push buttons has leds
  pinMode(PIN_ENABLE_LEDS_BUTTONS, OUTPUT);
  digitalWrite(PIN_ENABLE_LEDS_BUTTONS, LOW);

  FastLED.addLeds<NEOPIXEL, PIN_LED_OUTDOOR>(outdoor_leds, OUTDOOR_LED_COUNT);
  FastLED.addLeds<NEOPIXEL, PIN_LED_INDOOR>(indoor_leds, INDOOR_LED_COUNT);

  client.setServer(MQTT_SERVER, 1883);
  client.setCallback(mqtt_callback);

  wificonnect();

  outdoor_led_clear();
  indoor_led_clear();
  led_show();

  setup_timer1();
  ArduinoOTA.setPassword(OTA_PASS);
  ArduinoOTA.begin();
}

void mqtt_check_connection() {
  if (!client.connected()) {
    client.connect("door-esp32", MQTT_USERNAME, MQTT_PASSWORD);
    client.subscribe("indoor_led/state");
  }
}

void loop() {
  if (led_update == 1) {
    led_show();
    led_update = 0;
  }
  if (WiFi.status() != WL_CONNECTED) {
    wificonnect();
  }
  mqtt_check_connection();
  ArduinoOTA.handle();

  // Bounce2 updates
  door.update();
  button_all_lights_off.update();
  button_switch_light_on.update();
  door_sealed.update();

  client.loop();

  short current_door_status = door.read();

  if (button_all_lights_off.fell()) {
    //client.publish("/all_off_switch/state", "1");
Serial.println("Pressed");
  }

  // door is opened and door was closed before
  if (current_door_status == HIGH && door_status != 1) {
    // enable LEDs first
    if (outdoor_led_status == LED_OFF) {
      fill_rainbow(outdoor_leds, OUTDOOR_LED_COUNT, outdoor_hue++, 5);
      led_show();
      outdoor_led_status = LED_ON;
      // after close of door leave LEDs 5s on
      outdoor_timer_active = 250;

    }
    // if indoor LEDs already ON, do nothing
    if (indoor_led_status != LED_OPENHAB) {
      fill_rainbow(indoor_leds, INDOOR_LED_COUNT, indoor_hue++, 5);
      led_show();
      indoor_led_status = LED_ON;
      indoor_timer_active = 1000;
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
    // after close of door leave LEDs 5s on
    outdoor_timer_active = 250;
    if (indoor_led_status != LED_OPENHAB) {
      indoor_timer_active = 1000;
    }
  }
}
