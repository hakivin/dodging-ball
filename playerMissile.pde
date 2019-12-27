class PlayerMissile{
    float x, y;
    float w, h;
    float direction;
    
    PlayerMissile(float x, float y){
      this.x = x;
      this.y = y;
      w = 5.0;
      h = 20.0;
    }
  
    void display(){
      fill(100,191,255);
      ellipse(x-20,y,w,h);
      ellipse(x+20,y,w,h);
    }
    
    boolean launch(int speed){
      if(y >= 100)
        y -= speed;
      else{
        y = -500;
        return false;
      }
      return true;
    }
  }
