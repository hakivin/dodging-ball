boolean gameover= false, right = false, left = false, up = false, down = false, d = false, a = false, w = false, s = false;
Area area = new Area(50);
Player player1;
int sec;
void setup(){
  size(640,920);
  player1 = new Player();
  delay(1500);
}

void draw(){
  smooth();
  if(gameover){
    noLoop();
    redraw();
  }
  else{
    frameRate(60);
    area.display();  
    player1.display();
    if(area.checkWave() == 1){
      if(player1.hit(area.met))
        gameover = true;
    } else if(area.checkWave() == 2){
      if(player1.hitWall(area.walls))
        gameover = true;
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
