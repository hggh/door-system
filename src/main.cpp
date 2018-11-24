#include <Arduino.h>
#include <avr/power.h>

#include <FastLED.h>
#include <RFM69.h>
#include <LowPower.h>
#include <Bounce2.h>


#include "config.h"

RFM69 radio;
uint8_t led_brightness = 100;
volatile short timer_active = 0;
volatile unsigned short timer_count = 0;
volatile uint8_t hue = 0;
volatile boolean light_control = true;
volatile unsigned short door_status = 100;
volatile short led_display = 1;
CRGB leds[LED_COUNT];
Bounce debouncer = Bounce();

void leds_clear();


/*
 * ISR should called every second
 */
ISR(TIMER1_COMPA_vect) {
  timer_count++;

  fill_rainbow(leds, LED_COUNT, hue++, 5);
  led_display = 2;

  if (timer_count > 1500) {
    noInterrupts();
    leds_clear();
    TCCR1A = 0;
    TCCR1B = 0;
    timer_active = 0;
    interrupts();
  }
}

void setup_timer1() {
  noInterrupts();
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = 0;

  /*
   * 1/8000000 * 1024 = .00012800000000000000
   * 0.02/.000128 - 1= 7813
   */

  OCR1A = 156;
  TCCR1B |= _BV(WGM12);
  TCCR1B |= _BV(CS10);
  TCCR1B |= _BV(CS12);
  TIMSK1 |= _BV(OCIE1A);
  timer_count = 0;
  timer_active = 1;
  interrupts();
}

void leds_clear() {
  FastLED.clear(true);
  FastLED.show();
}

void setup() {
  pinMode(ALL_LIGHTS_OFF_BUTTON, INPUT_PULLUP);
  debouncer.attach(ALL_LIGHTS_OFF_BUTTON);
  debouncer.interval(50);


  pinMode(REED_SWITCH, INPUT);

  ADCSRA &= ~(1 << 7);
  power_twi_disable();
  power_adc_disable();

  if (DEBUG == 1) {
    Serial.begin(9600);
    Serial.println("Starting Door-System");
  }
  else {
    power_usart0_disable();
  }

  FastLED.addLeds<WS2812, WS2812_PIN>(leds, LED_COUNT);
  FastLED.setBrightness(led_brightness);
  leds_clear();

  radio.initialize(FREQUENCY, NODEID, NETWORKID);
  radio.encrypt(ENCRYPTKEY);
}

void send_door_status(uint8_t door_status) {
  char buffer[30] = "";
  if (door_status == 1) {
    sprintf(buffer, "%d;DoorStatus;OPEN", NODEID);
  }
  else {
    sprintf(buffer, "%d;DoorStatus;CLOSED", NODEID);
  }
  Serial.println(buffer);
  radio.sendWithRetry(GATEWAYID, buffer, strlen(buffer), 2);
}

void loop() {
  debouncer.update();
  if ( debouncer.fell() == true ) {
    char button_all_light_off[30] = "";
    sprintf(button_all_light_off, "%d;A_LIGHT_OFF", NODEID);
    radio.sendWithRetry(GATEWAYID, button_all_light_off, strlen(button_all_light_off), 2);
    Serial.println(button_all_light_off);
  }
  if (radio.receiveDone()) {
    String data;

    for (byte i = 0; i < radio.DATALEN; i++) {
      data += (char)radio.DATA[i];
    }
    uint8_t index = data.indexOf(';');
    String command = data.substring(0, index);

    if (radio.ACKRequested()) {
      radio.sendACK();
    }

    if (DEBUG == 1) {
      Serial.print('[');
      Serial.print(radio.SENDERID, DEC);
      Serial.print("] ");
      Serial.println(command);
    }

    if (command.equals("LIGHT")) {
      setup_timer1();
      fill_rainbow(leds, LED_COUNT, hue++, 5);
      FastLED.show();
    }

    if (command.equals("D_LIGHT")) {
      light_control = false;
      if (DEBUG == 1) {
        Serial.println("Light off");
      }
    }
    
    if (command.equals("E_LIGHT")) {
      light_control = true;
      Serial.println("Light on");
    }
  }
  if (digitalRead(REED_SWITCH) == LOW && light_control == true && timer_active != 1) {
    Serial.println("Door OPEN but timer was not active");
    setup_timer1();
    fill_rainbow(leds, LED_COUNT, hue++, 5);
    FastLED.show();
  }
  if (digitalRead(REED_SWITCH) == HIGH) {
      if (door_status != 0) {
      send_door_status(0);
    }
    door_status = 0;
  }
  if (digitalRead(REED_SWITCH) == LOW && door_status != 1) {
    send_door_status(1);
    door_status = 1;
  }
  if (led_display == 2) {
    FastLED.show();
    led_display = 0;
  }
}
