float speedx = 10;
float speedy = 5;
float x = 10;
float y = 5;
boolean gamestop=false;
int s;
void setup(){
  size(500,500);
}

void draw(){
  background(50);
  mrhaashalp();
  ball();
  move();
  bounce();
  bar();
  reset();
}

void ball(){
  fill(255);
  ellipse(x,y,20,20);
}
void change(){
  speedx = speedx * -1;
}
void move(){
  x = x + speedx;
  y = y + speedy;
  speedx = speedx +0.01;
    speedy = speedy +0.01;
}
void bounce(){
  if((x > width - 10)||(x < 10)){
 change();
  }
  if(y < 10){
   speedy = speedy * -1;
  }
  if((y > height - 30)&&(x > mouseX)&&(x < mouseX + 900)){
  speedy = speedy * -1;
  s=s+1;
}
if(y > 490){
  y = 510;
background(random(255),random(255),random(255));
  
  textSize(50);
  text("GAME OVER",100,250);
  float x;
float y = 100;
 for(x=0; x<width; x = x + 1){
  for(y=0; y<height; y = y + 1){
  
    int r = (int) random(255);
     int g = (int) random(255);
      int b = (int) random(255);
    fill(r,g,b);
  ellipse(x,y,10,10);
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
}
void bar(){
  fill(255);
  rectMode(CORNER);
  rect(mouseX, 480, 900,5);
} // end void bar

void reset(){
  if(key == 'r'){
 gamestop=false;
  x = 50;
  y = 50;
  }
  
}

void mrhaashalp(){
  textSize(40);
  fill(255);
  text("score:",50,50); 
  text(s,180,50);
  println(s);
}


void speeed(){
 if(s<10){
  speedx=speedx+10;
  speedy=speedy+10; 
 }
}