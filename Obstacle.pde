class Meteor{
  float x, y;
  float w, h;
  
  Meteor(float x, float y){
    this.x = x;
    this.y = y;
    w = 25.0;
    h = 50.0;
  }

  void display(){
    fill(255,0,0);
    ellipse(x,y,w,h);
  }
  
  boolean launch(int speed){
    if(y >= -10 && y <= 1200)
      y += speed;
    else{
      y = -50;
      return false;
    }
    return true;
  }
}

class Wall{
  int x, y, len, wid, dist;
  
  Wall(int x, int y){
    this.x = x;
    this.y = y;
    this.wid = 40;
    this.len = (int)random(190,390);
    this.dist = 100;
  }
  void display(){
    fill(0,200,0);
    rect(x,y,len,wid);
    rect(x+len+dist,y,width-len-dist,wid);
  }
  
  boolean launch(int speed){
    if(y >= -10 && y <= 1400)
      y += speed;
    else{
      y = -50;
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
  
  BigBall(){
    this.x = 640/2;
    this.radius = 1000;
    this.y = -800;
    this.speed = 2;
    this.right = true;
    coming = false;
    miss = new ArrayList();
    for(int i = 0; i < 200; i++){
      miss.add(new Missile(x,100));
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
      w = 10.0;
      h = 30.0;
      direction = random(-5,5);
    }
  
    void display(){
      fill(150,150,255);
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
    circle(x,y,radius);
  }
  
  void launchMissile(){
    if(coming){
      miss.get(0).display();
      miss.get(0).launch(5);
      for(int i = 1; i < miss.size(); i++){
        if(miss.get(i-1).y > 150){
          miss.get(i).display();
          miss.get(i).launch(5);
        }
      }
    }
  }
  
  void move(){
    if(y <= -400)
      y+=speed;
    else{
      coming = true;
      if(right){
        if(x <= 640-radius){
          x+= speed;
        } else {
          right = false;
        }
      } else {
        if(x >= radius){
          x-= speed;
        } else {
          right =true;
        }
      }
    }
  }
}
