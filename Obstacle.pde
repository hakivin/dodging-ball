class Meteor{
  float x, y;
  float w, h;
  PImage meteor;
  
  Meteor(float x, float y, PImage meteor){
    this.x = x;
    this.y = y;
    w = 25.0;
    h = 50.0;
    this.meteor = meteor;
  }

  void display(){
    fill(255,0,0);
    //ellipse(x,y,w,h);
    image(meteor,x,y);
  }
  
  boolean launch(int speed){
    if(y >= -100 && y <= 1400)
      y += speed;
    else{
      y = -150;
      return false;
    }
    return true;
  }
}

class Wall{
  int x, y, len, wid, dist;
  PImage aster;
  
  Wall(int x, int y, PImage aster){
    this.x = x;
    this.y = y;
    this.aster = aster;
    this.wid = 60;
    this.len = (int)random(190,390);
    this.dist = 100;
  }
  void display(){
    fill(0,200,0);
    //rect(x,y,len,wid);
    imageMode(CORNER);
    image(aster,len-640,y);
    //rect(x+len+dist,y,width-len-dist,wid);
    image(aster, len+dist,y);
    imageMode(CORNER);
  }
  
  boolean launch(int speed){
    if(y >= -10 && y <= 1400)
      y += speed;
    else{
      y = -200;
      return false;
    }
    return true;
  }
}

class BigBall{
  
  int x, y, radius, speed;
  boolean right;
  ArrayList<Missile> miss;
  int missLaunched;
  boolean coming;
  PImage bb;
  int playerx;
  int playery;
  
  BigBall(PImage bb){
    this.x = 640/2;
    this.radius = 400;
    this.y = -150;
    this.speed = 2;
    this.bb = bb;
    this.right = true;
    this.playerx = 940;
    this.playery = 640/2;
    coming = false;
    miss = new ArrayList();
    for(int i = 0; i < 200; i++){
      miss.add(new Missile(x,200));
    }
    missLaunched = 0;
  }
  
  class Missile{
    float x, y;
    float w, h;
    float direction;
    
    Missile(float x, float y){
      this.x = x;
      this.y = y;
      w = 5.0;
      h = 30.0;
      direction = random(-5,5);
    }
  
    void display(){
      fill(255,191,0);
      ellipse(x-20,y,w,h);
      ellipse(x,y,w,h);
    }
    
    boolean launch(int speed){
      x+=direction;
      if(y >= -10 && y <= 1200)
        y += speed;
      else{
        y = -50;
        return false;
      }
      return true;
    }
  }

  void display(){
    fill(255,0,0);
    //circle(x,y,radius);
    image(bb,x,y);
  }
  
  void launchMissile(){
    if(coming){
      miss.get(0).display();
      miss.get(0).launch(5);
      for(int i = 1; i < miss.size(); i++){
        if(miss.get(i-1).y > 250){
          miss.get(i).display();
          miss.get(i).launch(5);
        }
      }
    }
    //if(coming){
    //  miss.add(new Missile(x+640/2,200));
    //  miss.get(0).display();
    //  miss.get(0).launch(5);
    //  for(int i = 1; i < miss.size(); i++){
    //      if(miss.get(i-1).y > 300){
    //        //miss.add(new Missile(x+640/2,200));
    //        miss.get(i).display();
    //        miss.get(i).launch(5);
    //      }
    //      if(i == miss.size()-1 && miss.get(i).y > 300){
    //        miss.add(new Missile(-x+640/2,200));
    //        miss.add(new Missile(20-x+640/2,200));
    //        miss.get(i+1).display();
    //        miss.get(i+1).launch(5);
    //        miss.get(i+2).display();
    //        miss.get(i+2).launch(5);
    //      }
    //  }
    //}
  }
  
  void move(){
    if(y <= 50)
      y+=speed;
    else{
      coming = true;
      if(right){
        if(x <= 150){
          //x+= speed;
        } else {
          right = false;
        }
      } else {
        if(x >= -150){
          //x-= speed;
        } else {
          right =true;
        }
      }
    }
  }
}
