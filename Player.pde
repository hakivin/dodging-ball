class Player{
  int radius;
  int x;
  int y;
  int movspd;
  
  Player(){
    radius = 20;
    x = 640/2;
    y = 920-radius*2;
    movspd = 5;
  }
  
  void display(){
    fill(255);
    circle(x,y,radius*2);
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
    if(y >= radius)
      y-=movspd;
  }
  
  void moveDown(){
    if(y <= 920-radius-10)
      y+=movspd;
  }
  
  boolean hit(ArrayList<Meteor> obs){
    for(Meteor ob : obs){
      float distance = dist(x,y,ob.x,ob.y);
      if (distance <= radius + ob.w/2) {
          return true;
      }
    }
    return false;
  }
  
  boolean hitWall(ArrayList<Wall> walls){
    int testX = 0;
    int testY = 0;
    for(Wall wall : walls){
      if(wall.y <= wall.wid || wall.y > y)
        continue;
      if (x < wall.x)         testX = wall.x;        // left edge
      else if (x > wall.x+wall.len) testX = wall.x+wall.len;     // right edge

      if (y < wall.y)         testY = wall.y;        // top edge
      else if (y > wall.y+wall.wid) testY = wall.y+wall.wid;     // bottom edge
      
      float dist = dist(x,y,testX,testY);
      float dist2 = dist(x,y,testX+wall.dist,testY);
      
      if(dist <= radius || dist2 <= radius){
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
