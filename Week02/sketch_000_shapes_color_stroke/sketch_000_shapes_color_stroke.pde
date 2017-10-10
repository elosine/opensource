//PROCESSING INTRO
// https://processing.org
// http://fyprocessing.tumblr.com
// https://www.openprocessing.org


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

void setup() {
}

void draw() {
}

//we can add our first item to setup - size()
// size(width, height) will be the size of our canvas
// run this in setup, as we only need to establish the size once

void setup() {
  size(500, 500);
}

void draw() {
}
//background
//run the following

void setup() {
  size(500, 500);
}

void draw() {
  ellipse( mouseX, mouseY, 50, 50);
}

//see how the circles turn into a worm as you move the mouse
//now run this code

void setup() {
  size(500, 500);
}

void draw() {
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

rect (x, y, width, height);

//PROJECT:
//Josef Albers - Homage to the Square
//homage to the square image search
//article: https://www.khanacademy.org/humanities/art-1010/abstract-exp-nyschool/ny-school/a/albers-homage-to-the-square
//https://www.youtube.com/watch?v=FpTr_BDVjFI
//Using a 500x500 canvas create your own Homage to the Square
//Experiment with colors & perspective
//Look at some examples
//Make several and compare and contrast
//Be able to justify your choices

//other shapes
//line(x1, y1, x2, y2)
//triangle (x1, y1, x2, y2, x3, y3)
//quad (x1, y1, x2, y2, x3, y3, x4, y4)
//rect (x, y, width, height);
//ellipse (x, y, width, height);
//arc (x, y, width, height, start rads, end rads)
arc(width/2, height/2, 300, 300, -HALF_PI, 0);
arc(250, 250, 300, 300, HALF_PI, PI);
arc(width/2, height/2, 300, 300, radians(-40), radians(60));

//Introduce: translate, rotate, scale, push/pop matrix

//PROJECT:
//Suprematism
//Wikipedia: https://en.wikipedia.org/wiki/Suprematism
//Examples:
// https://www.guggenheim.org/artwork/movement/suprematism
// https://www.wikiart.org/en/kazimir-malevich/suprematism-1915
// https://www.liveauctioneers.com/item/1782412_65-nina-kogan-1887-1942-russian-suprematism-circ
// Suprematism google images
////same size as your screen
////Try to use at least one of each shape
////make shape drawing
println(mouseX, " : ", mouseY);

//variables
size(480, 120);
smooth();
int y = 100;
int d = 130;
ellipse(75, y, d, d);    // Left
ellipse(175, y, d, d);   // Middle
ellipse(275, y, d, d);   // Right

//Declare on root and assigning value in setup
int y, d;
void setup() {
  size(500, 500);
  y = height/2;
  d = 130;
}
void draw() {
  ellipse(75, y, d, d);    // Left
  ellipse(175, y, d, d);   // Middle
  ellipse(275, y, d, d);   // Right
}



//text

//install font from Create font menu

PFont myFont;

void setup() {
  size(200, 200);
  // Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //printArray(fontList);
  myFont = createFont("Georgia", 32);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("!@#$%", width/2, height/2);
}

//TRY:
// try picking different fonts, create font for each one, 
// different variable for each one
// different alignments
// different sizes next to each other

//translate and rotate text
//push matrix
PFont myFont;

void setup() {
  size(500, 500);
  // Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //printArray(fontList);
}

void draw() {
  myFont = createFont("Georgia", 32);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("!@#$%", width/2, height/2);
  translate(width/2, height/2);
  rotate(radians(45));
  text("!@#$%fdsafdsafdsafdsafdsafdsafdsafdsafdsafdsafsa", 0, 0);
}

PFont myFont;

void setup() {
  size(500, 500);
  // Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //printArray(fontList);
}

void draw() {
  myFont = createFont("Georgia", 32);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("!@#$%", width/2, height/2);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(45));
  text("!@#$%fdsafdsafdsafdsafdsafdsafdsafdsafdsafdsafsa", 0, 0);
  popMatrix();
  rect(0, 0, 50, 50);
}


//PROJECT:
// Concrete Poetry
// https://www.poets.org/poetsorg/text/brief-guide-concrete-poetry
// http://www.ubu.com/vp/
// http://www.getty.edu/research/exhibitions_events/exhibitions/concrete_poetry/
// concrete poetry google image search

//images
PImage img;

void setup() {
  img = loadImage("laDefense.jpg");
}

void draw() {
  imageMode(CORNER);
  image(img, 10, 10, 50, 50);  // Draw image using CORNER mode
}

//PROJECT
//Photo Collage
// http://www.anothermag.com/art-photography/3318/top-10-collage-artists-hannah-hoch-to-man-ray
// http://create.adobe.com/2016/7/21/trend_collage_art.html
//David Hockney
//Rauschenberg

//Arrays

//For loops

//grid

//connect the dots game