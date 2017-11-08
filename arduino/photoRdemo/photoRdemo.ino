const int sensorPin = 0;
const int ledPin = 9;

int lightLevel;
int calibratedlightLevel;
int maxThreshold = 0;
int minThreshold = 1023;


void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  lightLevel = analogRead(sensorPin);
  Serial.print(lightLevel);
  
  calibratedlightLevel = map(lightLevel, 200, 800, 0, 255);

  Serial.print("\t");
  Serial.println(calibratedlightLevel);

  analogWrite(ledPin, calibratedlightLevel);
  
}
