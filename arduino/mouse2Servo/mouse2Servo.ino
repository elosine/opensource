#include <Servo.h>  // servo library
Servo servo1;  // servo control object
int val = 0;

void setup() {
  Serial.begin(9600);
  servo1.attach(9, 900, 2100);  //Connect the servo to pin 9
  //with a minimum pulse width of
  //900 and a maximum pulse width of
  //2100.
}

void loop() {
  int position;

  while (Serial.available()) { // If data is available to read,
    val = Serial.read(); // read it and store it in val
  }
  servo1.write(val);
  delay(15);
}

