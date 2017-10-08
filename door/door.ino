#include <avr/power.h>

#include <FastLED.h>
#include <RFM69.h>
#include <LowPower.h>

#include "config.h"

RFM69 radio;
uint8_t led_brightness = 80;
volatile short timer_active = 0;
volatile unsigned short timer_count = 0;
volatile uint8_t hue = 0;
CRGB leds[LED_COUNT];


/*
 * ISR should called every second
 */
ISR(TIMER1_COMPA_vect) {
  if (timer_count > 2000) {
    noInterrupts();
    leds_clear();
    TCCR1A = 0;
    TCCR1B = 0;
    timer_active = 0;
    interrupts();
  }
  timer_count++;

  fill_rainbow(leds, LED_COUNT, hue++, 5);
  FastLED.show();
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
  pinMode(RELAY_PIN, OUTPUT);
  digitalWrite(RELAY_PIN, LOW);
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

void loop() {
  if (radio.receiveDone()) {
    String data;

    for (byte i = 0; i < radio.DATALEN; i++) {
      data += (char)radio.DATA[i];
    }
    uint8_t index = data.indexOf(';');
    String command = data.substring(0, index);

    if (radio.ACKRequested()) {
      byte theNodeID = radio.SENDERID;
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
  }
  if (timer_active == 0) {
    LowPower.powerDown(SLEEP_FOREVER, ADC_ON, BOD_OFF);
  }
}
