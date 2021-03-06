/* A Processing bridge from Arduino */
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
import processing.serial.*; //import serial library

Serial ino;  // Create object from Serial class

void setup() {
  size(500, 500);

  //serial///////////////////////////////////////////////////////////////////
  printArray(Serial.list()); // Print a list of available serial ports
  String portName = Serial.list()[1]; //the # here is the port # you wish to use from the serial list above
  ino = new Serial(this, portName, 9600); //make sure the baud rate is synced with the baud rate your arduino is running at
  //////////////////////////////////////////////////////////////////////////

  //
} //end setup

void draw() {
  background(0);
  //
} //end draw

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
void serialEvent(Serial ino) { 
  // read the serial buffer:
  String msg = ino.readStringUntil( '\r' );

  // if we get any bytes other than the linefeed:
  if (msg != null) {
    // remove the linefeed
    msg = trim(msg);

    println(msg);
  }// end if(msg !=null)
} //end serialEvent
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////