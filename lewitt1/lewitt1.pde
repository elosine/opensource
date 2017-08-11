int[] x,y;

void setup(){
  size(500,500);
  x = new int[50];
  y = new int [50];
  for (int i=0;i<x.length;i++){
    x[i] = int(random(0,width));
  }
  
  for (int i=0;i<y.length;i++){
    y[i] = int(random(0,height));
  }
}


void draw(){
  background(255);
  
  noStroke();
  fill(0);
  for(int i=0;i<x.length;i++){
    ellipse(x[i], y[i], 5,5);
  }
  
  strokeWeight(1);
  stroke(0);
  for(int i=0;i<x.length;i++){
    for(int j=0;j<x.length;j++){
    
    
    }
  }
  
}