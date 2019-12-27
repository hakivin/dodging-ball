class Area{
  ArrayList<Meteor> met;
  ArrayList<Wall> walls;
  BigBall bb;
  int size;
  int wave;
  PImage img, bg, aster, bigball;
  boolean clear;
 
  int x = 1;
  int y = 1;
  boolean right, up;
  Area(int size, PImage bg, PImage img, PImage aster, PImage bigball){
    met = new ArrayList();
    walls = new ArrayList();
    bb = new BigBall(bigball);
    this.bg = bg;
    this.right = false;
    this.up = false;
    this.aster = aster;
    this.size = size;
    this.bigball = bigball;
    this.img = img;
    createMeteor();
    wave = 1;
    display2();
    clear = false;
  }
  
  void createMeteor(){
    for(int i = 0; i <= size; i++){
      met.add(new Meteor(random(640),-20,img));
    }
  }
  
  int checkWave(){
    return wave;
  }
  void display(){
    fill(100,100,255);
    pushMatrix();
    if(right){
      x++;
      if(x >= -10)
        right = false;
    } else {
      x--;
      if(x <= -1200)
        right = true;
    }
    if(up){
      y++;
      if(y >= 0){
        up = false;
      }
    } else {
      y--;
      if( y <= -100){
        up = true;
      }
    }
    imageMode(CORNER);
    translate(x,y);
    image(bg,-50,-50);
    imageMode(CENTER);
    popMatrix();
    //rect(0,0,width,height);
    if(wave == 1){
      met.get(0).display();
      met.get(0).launch(10);
      strafe();
    } else if(wave == 2){
      walls.get(0).display();
      walls.get(0).launch(5);
      launchWalls();
    } else if(wave == 3){
       launchBb();
       createMeteor();
    }
    clear = bb.retreat;
  }
  
  void strafe(){
    for(int i = 1; i < met.size(); i++){
      if(met.get(i-1).y >= random(100,300)){
        met.get(i).display();
        boolean state = met.get(i).launch(10);
        if(!state){
          met.remove(i);
          if(met.size() <= 2){
            wave = 2;
          }
        }
      }
    }
  }
  
  void launchBb(){
    bb.display();
    bb.move();
    bb.launchMissile();
  }
  
  void launchWalls(){
    for(int i = 1; i < walls.size(); i++){
      if(walls.get(i-1).y >= 350){
        walls.get(i).display();
        boolean state = walls.get(i).launch(5);
        if(!state){
          walls.remove(i);
          if(walls.size() <= 2)
             wave = 3;
          }
        }
      }
    }
  
  void display2(){
    for(int i = 0; i <= size-20; i++){
      walls.add(new Wall(0,0,aster));
    }
  }
}
