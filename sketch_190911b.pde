float x;
float y = 100;
void setup(){
  fullScreen();
}

void draw(){
  background(0);
 x = 0;
 for(x=0; x<width; x = x + 0.000000000000000000000000000000000000000000001){
  for(y=0; y<height; y = y + 0.000000000000000000000000000000000000000000001){
  
    int r = (int) random(255);
     int g = (int) random(255);
      int b = (int) random(255);
    fill(r,g,b);
  ellipse(x,y,0.000000000000000000000000000000000000000000001,0.000000000000000000000000000000000000000000001);
  if(mouseY<1){
   x = x+1; 
  }else{
   y=y+mouseY; 
  }
  }
  if(mouseX<1){
    y = y + mouseX;
  }else{
    x=x + mouseX;
  }
 }
  }