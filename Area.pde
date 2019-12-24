class Area{
  int y = 0;
  ArrayList<Meteor> met;
  ArrayList<Wall> walls;
  BigBall bb;
  int size;
  int wave;
  Area(int size){
    met = new ArrayList();
    walls = new ArrayList();
    bb = new BigBall();
    this.size = size;
    for(int i = 0; i <= size; i++){
      met.add(new Meteor(random(640),0));
    }
    wave = 2;
    display2();
  }
  
  int checkWave(){
    return wave;
  }
  void display(){
    fill(0,0,0);
    rect(0,0,width,height);
    if(wave == 1){
      met.get(0).display();
      met.get(0).launch(10);
      strafe();
    } else if(wave == 2){
      walls.get(0).display();
      walls.get(0).launch(10);
      launchWalls();
    } else if(wave == 3){
       launchBb();
    }
  }
  
  void strafe(){
    for(int i = 1; i <= size; i++){
      if(met.get(i-1).y >= random(100,300)){
        met.get(i).display();
        boolean state = met.get(i).launch(10);
        if(i == size){
          if(!state){
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
    for(int i = 1; i <= size; i++){
      if(walls.get(i-1).y >= 350){
        walls.get(i).display();
        boolean state = walls.get(i).launch(10);
        if(i == size){
          if(!state){
            wave = 3;
          }
        }
      }
    }
  }
  
  void display2(){
    for(int i = 0; i <= size; i++){
      walls.add(new Wall(0,0));
    }
  }
}
