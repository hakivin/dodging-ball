boolean gameover= false, right = false, left = false, up = false, down = false, d = false, a = false, w = false, s = false;
Area area;
Player player1;
int sec;
PImage jet;
void setup(){
  size(640,920);
  PImage met = loadImage("meteor.png");
  met.resize(40,100);
  frameRate(60);
  PImage bg = loadImage("spacebg3.jpg");
  PImage aster = loadImage("asteroid.png");
  PImage bigball = loadImage("bigball.png");
  aster.resize(640,80);
  //bg.resize(640,920);
  area = new Area(50,bg,met,aster,bigball);
  jet = loadImage("jet.png");
  jet.resize(50,90);
  player1 = new Player(jet);
  background(0);
  delay(1500);
}

void draw(){
  smooth();
  noStroke();
  if(gameover){
    noLoop();
    redraw();
  }
  else{
    area.display();  
    player1.display();
    area.bb.playerx = player1.x;
    area.bb.playery = player1.y;
    if(area.checkWave() == 1){
      if(player1.hit(area.met))
        gameover = true;
    } else if(area.checkWave() == 2){
      if(player1.hitWall(area.walls))
        gameover = true;
    } else if(area.checkWave() == 3){
      if(player1.hitBoss(area.bb)){
        gameover = true;
      }
    }
    if (left==true)
      {
        player1.moveLeft();
      }
      if (right==true)
      {
        player1.moveRight();
      }
      if (up==true)
      {
        player1.moveUp();
      }
      if (down==true)
      {
        player1.moveDown();
      }
    }
}

void keyPressed()
{
  if (keyCode == LEFT)
  {
    left = true;
  }
  if (keyCode == RIGHT)
  {
    right = true;
  }
  if (keyCode == UP)
  {
    up = true;
  }
  if (keyCode == DOWN)
  {
    down = true;
  }
  if (key == 'a')
  {
    a=true;
  }
  if (key == 'd' )
  {
    d=true;
  }
  if (key == 'w')
  {
    w=true;
  }
  if (key == 's' )
  {
    s=true;
  }
}

void keyReleased()
{
  if (keyCode == LEFT)
  {
    left = false;
  }
  if (keyCode==RIGHT)
  {
    right = false;
  }
  if (keyCode == UP)
  {
    up = false;
  }
  if (keyCode == DOWN)
  {
    down = false;
  }
  if (key=='a')
  {
    a=false;
  }
  if (key=='d')
  {
    d=false;
  }
  if (key == 'w')
  {
    w=false;
  }
  if (key == 's' )
  {
    s=false;
  }
}
