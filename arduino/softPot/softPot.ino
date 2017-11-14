const int SENSOR_PIN = 0; 

void setup() {
  Serial.begin(9600);
}

void loop() {
  int sensorValue;
  sensorValue = analogRead(SENSOR_PIN);
  Serial.println(sensorValue);
  delay(15);
}
