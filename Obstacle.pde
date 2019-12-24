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
  
  void launch(int speed){
    y += speed;
  }

}
