import gifAnimation.*;

boolean gameover= false, right = false, left = false, up = false, down = false, d = false, a = false, w = false, s = false;
Area area;
Player player1;
int sec;
PImage jet;
PImage evolvedjet, bgg;
int timer;
boolean isEvolved;
void setup(){
  size(640,920);
  PImage met = loadImage("meteor.png");
  met.resize(40,100);
  frameRate(60);
  PImage bg = loadImage("spacebg3.jpg");
  PImage aster = loadImage("asteroid.png");
  PImage bigball = loadImage("bigball.png");
  evolvedjet = loadImage("spaceship.png");
  evolvedjet.resize(50,90);
  aster.resize(640,80);
  //bg.resize(640,920);
  area = new Area(50,bg,met,aster,bigball);
  Gif myAnimation = new Gif(this, "Kamekameha.gif");
  myAnimation.play();
  jet = loadImage("jet.png");
  jet.resize(50,90);
  bgg = loadImage("bg2.jpg");
  player1 = new Player(jet);
  timer = -5;
  isEvolved = false;
  background(0);
  delay(1500);
  //area.clear = true;
}

void draw(){
  smooth();
  noStroke();
  if(gameover){
    noLoop();
    redraw();
  }
  else{
      if(!area.clear){
      area.display();  
      area.bb.playerx = player1.x;
      area.bb.playery = player1.y;
      if(area.checkWave() == 1){
        if(player1.hit(area.met))
          gameover = true;
      } else if(area.checkWave() == 2){
        if(player1.hitWall(area.walls))
          gameover = true;
      } else if(area.checkWave() == 3){
        player1.jet = evolvedjet;
        isEvolved = true;
        if(player1.hitBoss(area.bb)){
          gameover = true;
        }
      } 
    } else {
      changeStage();
    }
    player1.display();
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

void changeStage(){
  area.wave = 0;
  area.display();
  fill(255);
  textSize(64);
  textAlign(CENTER);
  text("You Win!",640/2,920/2);
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
  if (key == ' ' && isEvolved){
    player1.shoot();
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
