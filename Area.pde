class Area{
  int y = 0;
  ArrayList<Meteor> met;
  ArrayList<Wall> walls;
  int size;
  int wave;
  Area(int size){
    met = new ArrayList();
    walls = new ArrayList();
    this.size = size;
    for(int i = 0; i <= size; i++){
      met.add(new Meteor(random(640),0));
    }
    wave = 1;
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
  
  void launchWalls(){
    for(int i = 1; i <= size; i++){
      if(walls.get(i-1).y >= 350){
        walls.get(i).display();
        walls.get(i).launch(10);
      }
    }
  }
  
  void display2(){
    for(int i = 0; i <= size; i++){
      walls.add(new Wall(0,0));
    }
  }
}
