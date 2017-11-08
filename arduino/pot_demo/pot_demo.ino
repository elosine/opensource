int sensorPin = A0;
int ledPin = 13;
int sensorValue;
float blinkfactor = 0.1;


void setup() {
  pinMode(ledPin, OUTPUT);
}

void loop() {
  sensorValue = analogRead(sensorPin);
  
  digitalWrite(ledPin, HIGH);
  delay(sensorValue*blinkfactor);
  digitalWrite(ledPin,LOW);
  delay(sensorValue*blinkfactor);
  
}
