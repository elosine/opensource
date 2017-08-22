int x = 120;
int y = 60;
int r = 12;

void setup(){
  size(240, 120);
  smooth();
  ellipseMode(RADIUS);
}

void draw(){
  background(204);
  float d = dist (mouseX, mouseY, x, y);
  if (d<r){
r=24;
fill(0);
  }
  else{
    r=12;
    fill(255);
  }
  ellipse(x,y,r,r);
}