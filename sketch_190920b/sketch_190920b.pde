class Asteroid{



  PVector pos;



  PVector vel;



  PShape s;







  float scale;



  int sides;







  ArrayList<Line> lines;







  Asteroid(float x, float y, int _sides, float _scale){



    pos = new PVector(x, y);



    vel = new PVector(random(-1, 1), random(-1,1));



    lines = new ArrayList<Line>();



    scale = _scale;



    sides = _sides;



    build();    



  }







  Asteroid(float x, float y, int _sides){



    pos = new PVector(x, y);



    vel = new PVector(random(-1, 1), random(-1,1));



    lines = new ArrayList<Line>();



    scale = 1;



    sides = _sides;



    build();    



  }











  void update(){



    pos.add(vel);



    for(Line l: lines){



      l.update(pos);



    }







    if(pos.x > width){



      pos.x = 0;



    }



    if(pos.y > height){



      pos.y = 0;



    }



    if(pos.x < 0){



      pos.x = width;



    }



    if (pos.y < 0){



      pos.y = height;



    }



  }







  void show(){



    for(Line l: lines){



      l.show();



    }



  }  







  void build(){



    Line l;



    float x1;



    float x2 = 0;



    float y1;



    float y2 = 0;



    x1 = cos(0 * 0.1 * TWO_PI)*(random(10, 40)*scale);



    y1 = sin(0 * 0.1 * TWO_PI)*(random(10, 40)*scale);



    float ox = x1;



    float oy = y1;



    for(int i = 1; i < sides; i++){



      x2 = cos(i * 0.1 * TWO_PI)*(random(10, 40)*scale);



      y2 = sin(i * 0.1 * TWO_PI)*(random(10, 40)*scale);



      l = new Line(x1, y1, x2, y2, pos.x, pos.y);



      lines.add(l);



      x1 = x2;



      y1 = y2;



    }







    l = new Line(x2, y2, ox, oy, pos.x, pos.y);



    lines.add(l);



  }



}  








/* Bullet Class







This class is used for drawing player bullets.



Bullets handle collision with asteroids by drawing a line



from their previous position and their current position and



checking if that line intersects any Lines of each Asteroid.







*/







class Bullet{



  PVector pos;



  PVector vel;



  PVector prevPos;







  Bullet(float x, float y, float vx, float vy){



    pos = new PVector(x, y);



    vel = new PVector(vx, vy);



    prevPos = new PVector(x,y);



  }







  void update(){



    collision();



    vel.setMag(2);



    prevPos = pos.copy();



    pos.sub(vel);



  }







  void collision(){



    for(int i = 0; i < asteroids.size(); i++){



      Asteroid a = asteroids.get(i);



      for(Line l: a.lines){



        if(doIntersect(pos.x, pos.y, prevPos.x, prevPos.y, l.pos1.x+l.center.x, l.pos1.y+l.center.y, l.pos2.x+l.center.x, l.pos2.y+l.center.y)){



          ship.bullets.remove(this);



          float os = a.scale;



            Asteroid ab = new Asteroid(a.pos.x, a.pos.y, a.sides-1, os*.5);



            Asteroid ac = new Asteroid(a.pos.x, a.pos.y, a.sides-1, os*.5);



            if(ab.scale > .125){



              asteroids.add(ab);



              asteroids.add(ac);



            }



            asteroids.remove(a);



        }



      }



    }



  }







  void show(){



     point(pos.x, pos.y);



  }



}  








/* Input







Methods used for handling Keyboard input.







*/







void keyPressed(){



  if (keyCode == LEFT){



    ship.rotation -=.1;



  }



  if (keyCode == RIGHT){



    ship.rotation +=.1;







  }



  if (keyCode == UP){



    ship.boost();



  }







  if (key == ' '){



    ship.shoot();



  }



}  








/* Line Intersection Calculation







These methods calculate if two line are intersecting.



Currently only used for Asteroid-Bullet collision check.



Possibly can be expanded to Asteroid-Ship Collision.







*/







boolean onSegment(PVector p, PVector q, PVector r){



  if((q.x <= max(p.x, r.x) && q.x >= min(p.x, r.x) && q.y <= max(p.y, r.y) && q.y >= min(p.y, r.y))){



  return true;



  }



  return false;



}







int orientation(PVector p, PVector q, PVector r){



    float val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y);



    if(val == 0){return 0;}  // colinear



    if(val>0){return 1;}



    else{return 2;}



}







boolean doIntersect(float a1x1, float a1y1, float a1x2, float a1y2, float a2x1, float a2y1, float a2x2, float a2y2){







    PVector p1 = new PVector(a1x1, a1y1);



    PVector q1 = new PVector(a1x2, a1y2);



    PVector p2 = new PVector(a2x1, a2y1);



    PVector q2 = new PVector(a2x2, a2y2);







    int o1 = orientation(p1, q1, p2);



    int o2 = orientation(p1, q1, q2);



    int o3 = orientation(p2, q2, p1);



    int o4 = orientation(p2, q2, q1);







    if (o1 != o2 && o3 != o4){



        return true;



    }



    if (o1 == 0 && onSegment(p1, p2, q1)){



      return true;



    }







    if (o2 == 0 && onSegment(p1, q2, q1)){



        return true;



    }







    if (o3 == 0 && onSegment(p2, p1, q2)){



      return true;



    }







    if (o4 == 0 && onSegment(p2, q1, q2)){



      return true;



    }







    return false; 



}  








/* Line Class







This class is used for drawing Asteroids.



This was implemented to allow the bullet and asteroid 



collision to be close to pixel accurate







*/







class Line{



  PVector pos1;



  PVector pos2;



  PVector center;







  Line(float x, float y, float xx, float yy, float cx, float cy){



    pos1 = new PVector(x, y);



    pos2 = new PVector(xx, yy);



    center = new PVector(cx, cy);



  }







  void update(PVector px){



    center = px.copy();



  }







  void show(){



    line(center.x + pos1.x, center.y+pos1.y, center.x+pos2.x, center.y+pos2.y);



  }



}  








Asteroid a;



Ship ship;



ArrayList<Asteroid> asteroids;







void setup(){



  size(800, 600);



  asteroids = new ArrayList<Asteroid>();



  createAsteroids();



  ship = new Ship(width*.5, height*.5);



}







void draw(){



  background(0);



  if (asteroids.size() > 0){



    for(Asteroid a: asteroids){



      a.show();



      a.update();



    }



  }



  else{



    createAsteroids();



  }



  ship.show();



  ship.update();



}







void createAsteroids(){



    for(int i = 0; i < 4; i++){



    a = new Asteroid(random(width), random(height), 10);



    asteroids.add(a);



  }



}  





class Ship{



  PVector pos;



  PVector vel;



  PVector acc;



  PShape s;



  float rotation;



  float heading;



  Bullet b;



  ArrayList<Bullet> bullets;



  //ArrayList<Line> shape;



  float maxBoost;







  Ship(float x, float y){



    //shape = new ArrayList<Line>();



    bullets = new ArrayList<Bullet>();



    pos = new PVector(x, y);



    vel = new PVector(0,0);



    acc = new PVector(0,0);



    s = build();



    rotation = 0;



    heading = rotation;



    maxBoost = 1.5;



  }







  void update(){



    vel.add(acc);



    if(vel.mag() > maxBoost){



      vel.setMag(maxBoost);



    }



    pos.add(vel);



    if(pos.x > width+s.getWidth()){



      pos.x = 0 - s.getWidth()/2;



    }



    if(pos.y > height+s.getWidth()){



      pos.y = 0 - s.getWidth()/2;



    }



    if(pos.x < 0 - s.getWidth()){



      pos.x = width+s.getWidth()/2;



    }



    if (pos.y < 0 - s.getWidth()){



      pos.y = height+s.getHeight()/2;;



    }



    acc.mult(0);











    for(int i = bullets.size()-1; i >= 0; i--){



      b = bullets.get(i); 



      if(b.pos.x > width+s.getWidth()){



          bullets.remove(b);



          }



        else if(b.pos.y > height+s.getWidth()){



          bullets.remove(b);



          }



        else if(b.pos.x < 0 - s.getWidth()){



          bullets.remove(b);



          }



        else if (b.pos.y < 0 - s.getWidth()){



          bullets.remove(b);



          }



        }











  for(int i = bullets.size()-1; i >=0; i--){



      b = bullets.get(i);



      b.update();



      b.show();



    }



  }







  void show(){



    s.rotate(rotation);



    heading += rotation;



    rotation = 0;



    shape(s, pos.x, pos.y);



    stroke(255);







    //for(Line l: shape){



    //  l.update(pos);



    //  l.show();



    //}







  } 







  PShape build(){



    //Line l;



    //l = new Line(pos.x, pos.y + 7, pos.x - 6, pos.y + 4 , pos.x, pos.y);



    //shape.add(l);



    //l = new Line(pos.x - 6, pos.y + 4, pos.x + 6, pos.y + 4, pos.x, pos.y);



    //shape.add(l);



    //l = new Line(pos.x + 6, pos.y + 4, pos.x, pos.y + 7, pos.x, pos.y);



    //shape.add(l);







    PShape r = createShape();



    r.beginShape();



    r.noFill();



    r.stroke(0, 255, 0);



    r.vertex(0, -7);



    r.vertex(6, 7);



    r.vertex(-6, 7);



    r.endShape(CLOSE);



    return r;



  }



  void boost(){



    PVector dir = new PVector(sin(-heading), cos(-heading));



    dir.setMag(.5);



    acc.sub(dir);



  }



  void shoot(){



    if(bullets.size() <= 4){



      bullets.add(new Bullet(pos.x, pos.y, sin(-heading), cos(-heading)));  



    }



  }



}