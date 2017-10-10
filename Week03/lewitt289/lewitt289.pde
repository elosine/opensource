/*
289
A 6-inch (15 cm) grid covering each of the four 
black walls. White lines to points on the grids. 
Fourth wall: twenty-four lines from the center, 
twelve lines from the midpoint of each of the 
sides, twelve lines from each corner.
(The length of the lines and their placement 
are determined by the drafter.) 
(Detail: 4th wall only)

*/


int[] x, y;


void setup() {
  size (500, 500);
  background(0);
  x = new int[19];
  y = new int[19];

  for (int i=0; i<x.length; i++) {
    x[i] = (25*i) + 25;
  } 
   for (int i=0; i<y.length; i++) {
    y[i] = (25*i) + 25;
  }
  
  /*
  int ii = 0;
  int sz = 0;
  while (sz<=width) {
    x= append(x, (25*ii) + 25);
    sz = (25*ii) + 25;
    ii++;
  }
  */

  //24 lines from the center
  for (int i=0; i<24; i++) {
    int xt = int(random(x.length));
    int yt = int(random(y.length));
    stroke(255);
    strokeWeight(1);
    line(width/2, height/2, x[xt], y[yt]);
  }
  //12 lines from the midpoint of each side
  for (int i=0; i<12; i++) {
    int xt = int(random(x.length));
    int yt = int(random(y.length));
    stroke(255);
    strokeWeight(1);
    line(width/2, 0, x[xt], y[yt]);
  }
  //12 lines from the midpoint of each side
  for (int i=0; i<12; i++) {
    int xt = int(random(x.length));
    int yt = int(random(y.length));
    stroke(255);
    strokeWeight(1);
    line(width/2, height, x[xt], y[yt]);
  }
  //12 lines from the midpoint of each side
  for (int i=0; i<12; i++) {
    int xt = int(random(x.length));
    int yt = int(random(y.length));
    stroke(255);
    strokeWeight(1);
    line(width, height/2, x[xt], y[yt]);
  }
  //12 lines from the midpoint of each side
  for (int i=0; i<12; i++) {
    int xt = int(random(x.length));
    int yt = int(random(y.length));
    stroke(255);
    strokeWeight(1);
    line(0, height/2, x[xt], y[yt]);
  }
  //12 lines from each corner
  for (int i=0; i<12; i++) {
    int xt = int(random(x.length));
    int yt = int(random(y.length));
    stroke(255);
    strokeWeight(1);
    line(0, 0, x[xt], y[yt]);
  }
  //12 lines from each corner
  for (int i=0; i<12; i++) {
    int xt = int(random(x.length));
    int yt = int(random(y.length));
    stroke(255);
    strokeWeight(1);
    line(width, 0, x[xt], y[yt]);
  }
  //12 lines from each corner
  for (int i=0; i<12; i++) {
    int xt = int(random(x.length));
    int yt = int(random(y.length));
    stroke(255);
    strokeWeight(1);
    line(width, height, x[xt], y[yt]);
  }
  //12 lines from each corner
  for (int i=0; i<12; i++) {
    int xt = int(random(x.length));
    int yt = int(random(y.length));
    stroke(255);
    strokeWeight(1);
    line(0, height, x[xt], y[yt]);
  }
}

void draw() {
  // background(0);
  /* //draw grid
   for(int i=0;i<x.length;i++){
   for(int j=0;j<x.length;j++){
   noStroke();
   fill(255);
   ellipse(x[i], y[j], 5,5);
   }
   }
   */

  /*
  //24 lines from the center
   for(int i=0;i<24;i++){
   int xt = int(random(x.length));
   int yt = int(random(y.length));
   stroke(255);
   strokeWeight(1);
   line(width/2, height/2, x[xt], y[yt]);
   }
   */

  /*
  //12 lines from the midpoint of each side
   for(int i=0;i<12;i++){
   int xt = int(random(x.length));
   int yt = int(random(y.length));
   stroke(255);
   strokeWeight(1);
   line(width/2, 0, x[xt], y[yt]);
   }
   */
}