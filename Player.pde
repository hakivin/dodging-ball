class Player{
  int radius;
  int x;
  int y;
  int movspd;
  PImage jet;
  ArrayList<PlayerMissile> miss;
  
  Player(PImage jet){
    radius = 25;
    x = 640/2;
    y = 920-radius*3;
    movspd = 5;
    this.jet = jet;
    this.miss = new ArrayList();
  }
  
  void shoot(){
    PlayerMissile missile = new PlayerMissile(x,y);
    miss.add(missile);
  }
  
  void display(){
    fill(255);
    //circle(x,y,radius*2);
    imageMode(CENTER);
    image(jet,x,y);
    //imageMode(CORNER);
    for(int i = 0; i < miss.size(); i++){
      miss.get(i).display();
      boolean state = miss.get(i).launch(8);
      if(!state){
        miss.remove(i);
      }
    }
  }
  
  void moveLeft(){
    if(x >= radius)
      x-=movspd;
  }
  
  void moveRight(){
    if(x <= 640-radius)
      x+=movspd;
  }
  
  void moveUp(){
    if(y >= 50)
      y-=movspd;
  }
  
  void moveDown(){
    if(y <= 920-50)
      y+=movspd;
  }
  
  boolean hit(ArrayList<Meteor> obs){
    for(Meteor ob : obs){
      float distance = dist(x,y,ob.x,ob.y);
      if (distance <= radius + ob.w/1.5) {
          return true;
      }
    }
    return false;
  }
  
  boolean hitWall(ArrayList<Wall> walls){
    for(Wall wall : walls){
      if(wall.y <= wall.wid || wall.y > y)
        continue;
      if((y-radius <= wall.y+wall.wid && y-radius >= wall.y) && (x <= wall.len || x >= wall.len+wall.dist)){
        return true;
      }
    }
    return false;
  }
  
  boolean hitBoss(BigBall bb){
    if(dist(x,y,bb.x,bb.y) <= radius+bb.radius/2){
      return true;
    }
    for(BigBall.Missile ms : bb.miss){
      float distance = dist(x,y,ms.x,ms.y);
      if (distance <= radius + ms.h/4) {
          return true;
      }
    }
    return false;
  }
  
  boolean hit(){
    if(get((int)x-radius,(int)y)==color(0,255,0)){// left player
      return true;
    } else if(get((int)x+radius,(int)y)==color(0,255,0)){//right player
      return true;
    } else if(get((int)x,(int)y-radius)==color(0,255,0)){//up player
      return true;
    } else if(get((int)x,(int)y+radius)==color(0,255,0)){//bottom player
      return true;
    }
    return false;
  }
}
