
//000////////////////////////////////////////////////////////////////////
//First let's draw a circle
//(as you can see double-forward-slash is used to comment)
//Using the 'ellipse' function the arguments are as follows:
// ellipse( center-x, center-y, width, height)
ellipse(50, 50, 40, 40);
//Hit the play button or cmd/ctrl-r to run the sketch
//Getting Help
//Hightlight the word 'ellipse' and right-click -> Find in Reference
//This will take you to a help page
//Use the ';' semi-colon to end a line of code
/////////////////////////////////////////////////////////////////////////


//001////////////////////////////////////////////////////////////////////
//Fill & Stroke
//You can color fill the circle / or not using the fill(r, g, b)
//or noFill() functions
//Processing uses the RGB spec 0-255 for each color
// fill(0, 0, 255) will be a blue circle
//You can use the Color Selector under the Tools menu to 
//help you find a color

fill(153, 255, 0); //lime green
ellipse(50, 50, 40, 40);

//noFill() or noStroke() will leave out the fill or stroke

noStroke();
fill(153, 255, 0); //lime green
ellipse(50, 50, 40, 40);

//////

noFill();
stroke(153, 255, 0); //lime green
ellipse(50, 50, 40, 40);

// TRY: Draw 3 circles - one with stroke & fill, one with fill & no stroke
// one with stroke and no fill. 
//If the circles overlap, notice the drawing order
fill(153, 255, 0);
stroke(255, 0, 255);
ellipse(33, 33, 60, 60);

noFill();
stroke(255, 255, 0);
ellipse(67, 50, 60, 60);

noStroke();
fill(0, 255, 255);
ellipse(33, 67, 60, 60);
/////////////////////////////////////////////////////////////////////////

//002////////////////////////////////////////////////////////////////////
//setup, draw, size, background, width, height

//There are 3 main areas in a Processing sketch:
//The sketch level, the one we are using now,
//this is the base level.
//setup - all the code here is run once at
//the beginning when you run your sketch
//draw - the code here runs continuously at a
//frame rate. For example at 60 frames per second
//all the code is run in order then run again
//16.67 milliseconds later, etc.
//from now on, we will always have a setup and draw area
//Here is the syntax:

void setup(){
  
}

void draw(){
  
}

//we can add our first item to setup - size()
// size(width, height) will be the size of our canvas
// run this in setup, as we only need to establish the size once

void setup(){
  size(500, 500);
  
}

void draw(){
  
}
//background
//run the following

void setup(){
  size(500, 500);
}

void draw(){
  ellipse( mouseX, mouseY, 50, 50);
}

//see how the circles turn into a worm as you move the mouse
//now run this code

void setup(){
  size(500, 500);
}

void draw(){
  background(0); //black 255 is white
  ellipse( mouseX, mouseY, 50, 50);
}

//we see only a single circle because background
//is drawing a rectangle the size of the canvas
//every frame.

//Finally width & height
// 'width' & 'height' are reserved variables that
//always hold the width and height of the canvas
//these are only available after you run size()

//TRY: Draw a circle in the center of the canvas
//using width, height and some simple math

//other shapes

//shape drawing
////same size as your screen
////use at least one of each shape
////make shape drawing

//variables
////see processing book

//text

//images