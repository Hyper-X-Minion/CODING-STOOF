class snowman{
 float x;
 float y;
 float size;
char c;
float speedy = 1;
float xx; 
float yy;
float head;
float speeedx = random(-10,10);
float speeedy = random(-5,5);
float sizes;
snowman[] snows;
snowman(float xin,float yin,float sizein, float headin){
   x =xin;
  y =yin;
  size =sizein;
head = headin;
 xx =x;
  yy = y-size/2-size*.8-size/2*.5-10;
  c=(char)int(random(97,122));
}

void display(){
   fill(255,255,255);
  ellipse(x,y,size,size);
  ellipse(x,y-size/2-size/2*.8,size*.8,size*.8);
  ellipse(x,y-size/2-size*.8-size/2*.5,size*.5,size*.5);
   textAlign(CENTER, CENTER);
   textSize(size*0.5/2+size/2);
  fill(0);
  text(c,x,y);
  yy=yy+speedy;
  character();
  
  
}
void leave(){
  if((mouseX > x-size)&&(mouseX < x +size)&&(mouseY> y -size)&&(mouseY< y +size)&&(mousePressed)&&(size<100)){
   speeedx=random(-10,10);
   speeedy=random(-5,5);
 
}else{
    x=x+speeedx;
  y=y+speeedy;
}

}
void move(){

   if((x > width )||(x < 0)){
 x=width/2;
 y=height/2;
  }
  if((y < 0)||(y>height)){
   x=width/2;
 y=height/2;
  }
  
}

void character(){
 if(keyPressed){
   if(key==c){
   if(size>1){
    size=size+5;
    if(size>100){
    size=0;
    }
   }
 }
 }
 }
}

  
  