import gifAnimation.*;

boolean gameover= false, right = false, left = false, up = false, down = false, d = false, a = false, w = false, s = false;
boolean win;
Area area;
Player player1;
int sec;
PImage jet;
PImage evolvedjet, bgg, logo, go, yw;
int timer;
boolean isEvolved;
boolean play;

int slideRight;
int slideLeft;
void setup(){
  size(640,920);
  background(20);
  win = false;
  play = false;
  PImage met = loadImage("meteor.png");
  met.resize(40,100);
  frameRate(60);
  PImage bg = loadImage("spacebg3.jpg");
  PImage aster = loadImage("asteroid.png");
  PImage bigball = loadImage("bigball.png");
  go = loadImage("gameover.png");
  evolvedjet = loadImage("spaceship.png");
  yw = loadImage("youwin.png");
  logo = loadImage("logo.jpg");
  logo.resize(640,300);
  evolvedjet.resize(50,90);
  aster.resize(640,80);
  //bg.resize(640,920);
  this.slideRight = 1;
  this.slideLeft = 1;
  area = new Area(50,bg,met,aster,bigball);
  Gif myAnimation = new Gif(this, "Kamekameha.gif");
  myAnimation.play();
  jet = loadImage("jet.png");
  jet.resize(50,90);
  bgg = loadImage("bg2.jpg");
  player1 = new Player(jet);
  timer = -5;
  isEvolved = false;
  //area.clear = true;
}

void reset(){
  setup();
}

void draw(){
  smooth();
  noStroke();
  if(play){
  if(gameover){
    gameover();
    //noLoop();
    //redraw();
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
      win = true;
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
  else{
    home();
  }
}

void changeStage(){
  area.wave = 0;
  area.display();
  fill(255);
  //textSize(64);
  //textAlign(CENTER);
  //text("You Win!",640/2,920/2);
  imageMode(CENTER);
  image(yw,640/2,920/2);
  //textSize(64);
  //textAlign(CENTER);
  text("Press ENTER to Play Again",640/2,920-350);
}

void gameover(){
  fill(20);
  pushMatrix();
  translate(slideRight,0);
  for(int i = 0; i < 20; i+=2){
    rect(-640,i*46,640,46);
  }
  popMatrix();
  slideRight += 10;
  pushMatrix();
  translate(slideLeft,0);
  for(int i = 1; i < 20; i+=2){
    rect(640,i*46,640,46);
  }
  popMatrix();
  slideLeft -= 10;
  //textSize(100);
  //textAlign(CENTER);
  //text("Game Over",640/2,920/2);
  //textSize(30);
  fill(200);
  imageMode(CENTER);
  image(go,640/2,920/3);
  text("Press ENTER to Play Again",640/2,920-350);
}

void home(){
  imageMode(CORNER);
  image(logo,0,50);
  imageMode(CENTER);
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text("Press ENTER to Play",640/2,920/2);
  textSize(30);
  text("Arrow Key to Move",640/2,920/2+64);
  text("Press SPACE to Shoot",640/2,920/2+100);
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
  if (keyCode == ENTER){
    play = true;
    if(gameover || win){
      reset();
      gameover = false;
    }
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
