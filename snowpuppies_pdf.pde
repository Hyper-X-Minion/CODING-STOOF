int z =100;
int i;
  snowman[] snowmans = new snowman[z];
void setup(){
  for(int i=0;i<z;i++){
    snowmans[i] = new snowman(random(width),random(height),random(10,40),random(23)); 
  }
  size(800,800); 
}

void draw(){
  background(0,0,0);
 for(i=0;i<z;i++){
    snowmans[i].display();
     snowmans[i].leave();
     snowmans[i].move();
    
}
}