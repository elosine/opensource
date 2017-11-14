
import processing.serial.*;

Serial myPort;  
int val;   
void setup() {
  size(500, 500);
  printArray(Serial.list());
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(0);
  val = int( map(mouseX, 0, width, 0, 180) );
  myPort.write(val);
}