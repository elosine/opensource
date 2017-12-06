import processing.serial.*;
import oscP5.*;
import netP5.*;
Serial ino;
OscP5 osc;
NetAddress sc;
float mappedVal;
float cSz = 10; //circle size
float cy = 10;
float csp = 20;
float dir = 1;
void setup(){
  size(800, 800);
  osc = new OscP5(this, 12321);
  sc = new NetAddress("127.0.0.1", 57120);
  printArray( Serial.list() );
  String portName = Serial.list()[1];
  ino = new Serial(this, portName, 9600);
}
void draw(){
  background(0);
  fill(0, 0, 255); //blue
  noStroke();
  cSz = map(mappedVal, 0.0, 1.0, 10, 480);
  
  csp = map(mappedVal, 0.0, 1.0, 1.0, 40.0);
  
  OscMessage msg = new OscMessage("/ctl1");
  msg.add(mappedVal);
  osc.send(msg, sc);
  
  //ellipse(width/2, height/2, cSz, cSz);
  
  OscMessage msg2 = new OscMessage ("/b1pitch");
  float pos = map(cy, 0.0, height, 4.0, 0.0);
  msg2.add(pos);
  osc.send(msg2, sc);
  
  
  if(cy>=height){ //if ball hits bottom of sketch
    OscMessage msg1 = new OscMessage("/hitbtm");
    osc.send(msg1, sc);
    dir = -1;
  }
  if(cy<=0) dir = 1;
  cy = cy + (csp*dir);
  ellipse(width/2, cy, 25, 25);
}

void serialEvent(Serial ino){
  String msg = ino.readStringUntil('\r');
  if(msg != null){ //makes sure there are msgs
    msg = trim(msg);
    mappedVal = map( int(msg), 0, 1023, 0.0, 1.0);
    mappedVal = constrain(mappedVal, 0.0, 1.0);
    println(mappedVal);
    //println(msg);
  }
}

void mousePressed(){
  OscMessage msg = new OscMessage("/test");
  msg.add(200);
  msg.add("kfdjskafjdskl");
  osc.send(msg, sc);
  
  
  
}