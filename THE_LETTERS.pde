 
int z =50;
int i;
  snowman[] snowmans = new snowman[z];
void setup(){
  
  size(800,800);

  for(int i=0;i<z;i++){
    snowmans[i] = new snowman(random(width),random(height),random(10,40),random(23)); 
  }
}
void draw(){
  background(0);
 
  for(i=0;i<z;i++){
    snowmans[i].display();
     snowmans[i].leave();
     snowmans[i].move();
  }
}


 