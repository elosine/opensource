

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
  size(500, 500);
  img = loadImage("einstein.jpg");
}

void draw() {
 imageMode(CORNER);
 scale(0.25);
 image(img, 10, 10);  
 //image(img, 10,10,500, 250);
 scale(0.25);
 
 image(img, 10, 250);
 }
 //push matrix
 
void draw() {
  imageMode(CORNER);
  pushMatrix();
  translate(10, 10);
  scale(0.25);
  image(img, 0, 0); 
  popMatrix();
  //image(img, 10,10,500, 250);
  scale(0.25);

  image(img, 10, 250);
}

//PROJECT
//Photo Collage
// http://www.anothermag.com/art-photography/3318/top-10-collage-artists-hannah-hoch-to-man-ray
// http://create.adobe.com/2016/7/21/trend_collage_art.html
//David Hockney
//Rauschenberg

//Arrays
//Arrays are an indexed list
//(show array chart)
//initializing & populating an array
int[] a= {5, 4, 3, 2, 1, 0};
void setup() {
  a = {5, 4, 3, 2, 1, 0};
  printArray(a);
}
//for loop example
//initialization, condition, increment
for (int i=0; i<10; i++) {
  println(i);
}
//i++ = i = i+1

//start from a different number
for (int i=5; i<10; i++) {
  println(i);
}

//different increment
for (int i=0; i<30; i=i+3) {
  println(i);
}

//TRY: How to count backwards?

//deploying the array using a for loop
int gap = 50;
int x = gap;

void setup() {
  size(500, 500);
}
void draw() {
  background(0);
  noStroke();
  fill(153, 255, 0);
  for (int i = 0; i<7; i++) {
    ellipse( x+(gap*i), 50, 40, 40 );
  }
}
//change number of circles, change gap

//populating & using array with for loop
int gap = 50;
int[] v; //declare
void setup() {
  size(500, 500);
  v = new int[7]; //initialize
  //populate
  for (int i=0; i<v.length; i++) {
    v[i] = gap + (gap*i);
  }
}

void draw() {
  background(0);
  noStroke();
  fill(153, 255, 0);
  for (int i=0; i<v.length; i++) {
    ellipse(50, v[i], 40, 40);
  }
}
//nested array making a grid
//vertical w/adjustment for centering
int gap = 50;
int[] v; //declare
void setup() {
  size(800, 800);
  v = new int[16]; //initialize
  //populate
  for (int i=0; i<v.length; i++) {
    v[i] = gap + (gap*i)-25;
  }
}

void draw() {
  background(0);
  noStroke();
  fill(153, 255, 0);
  for (int i=0; i<v.length; i++) {
    ellipse(50, v[i], 40, 40);
  }
}

//add horizontal
int gap = 50;
int[] v; 
int[] h;
void setup() {
  size(800, 800);
  v = new int[16]; //initialize
  //populate
  for (int i=0; i<v.length; i++) {
    v[i] = gap + (gap*i)-25;
  }
  h = new int[16]; //initialize
  //populate
  for (int i=0; i<h.length; i++) {
    h[i] = gap + (gap*i)-25;
  }
}

void draw() {
  background(0);
  noStroke();
  fill(153, 255, 0);
  //talk through loop
  for (int i=0; i<v.length; i++) {
    for (int j=0; j<v.length; j++) {
      ellipse(h[j], v[i], 40, 40);
    }
  }
}



//PROJECT
//connect the dots game
//add horizontal
int gap = 50;
int[] v; 
int[] h;
void setup() {
  size(800, 800);
  v = new int[16]; //initialize
  //populate
  for (int i=0; i<v.length; i++) {
    v[i] = gap + (gap*i)-25;
  }
  h = new int[16]; //initialize
  //populate
  for (int i=0; i<h.length; i++) {
    h[i] = gap + (gap*i)-25;
  }
}

void draw() {
  background(0);
  noStroke();
  fill(255);
  //talk through loop
  for (int i=0; i<v.length; i++) {
    for (int j=0; j<v.length; j++) {
      ellipse(h[j], v[i], 10, 10);
    }
  }
  stroke(255,0,0);
  line(h[0], v[0], h[1], v[0]);
  noStroke();
  fill(0,0,255);
  rect(h[0], v[0], 50,50);
}

//PROJECT: Sol LeWitt
//read: http://www.theartstory.org/artist-lewitt-sol.htm
//read: sentences on conceptual art
//http://www.altx.com/vizarts/conceptual.html
//choose one sentence and talk about it
//review some wall drawings