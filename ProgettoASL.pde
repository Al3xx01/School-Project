import java.util.Vector;
import java.lang.Math;
import java.util.Random;
import processing.sound.*;
PImage bg;
Ball b;
Paddle pBase;
Score score;
Vector<Squares> blocks= new Vector<Squares>();
boolean gameOver = false;
boolean victory = false;
SoundFile song1;
SoundFile song2;
SoundFile song3;
Random random = new Random();


void setup() 
{
  int j=0;
  size(550, 550);
  b = new Ball();
  pBase = new Paddle();
  score  = new Score();
  textSize(30);
  bg = loadImage("MindArkanoid.jpg");
  song1 = new SoundFile(this,"Wasted.aiff");
  song2 = new SoundFile(this,"Dub-Irish.mp3");
  song3 = new SoundFile(this,"Mission-Passed.aiff");
  for(j=0;j<(height/30)*3;j+=(height/30+10)){
    for(int k=0; k<=500; k+=width/10){
        blocks.add(new Squares(k, j));
    } 
  }
  song2.play();
}

void draw() 
{
  background(bg);
  b.update();
  b.show(randColori(), randColori(), randColori());
  pBase.show(randColori(), randColori(), randColori());
  pBase.movePaddle();
  fill(255,255,255,165);
  score.show("Score: ", 210, 500);
  drawBricks();
  println("x=" + b.getXSpeed());
  println("y=" + b.getYSpeed());
  pBase.TouchBall(b);
  if(gameOver){
    text("Game Over! Click to try again!", 60, 150);
  }
  if(victory){
    fill(randColori(), randColori(), randColori());
    text("You won! Click to play again!", 60, 150); 
  }
}

public int randColori() {
  return random.nextInt(255);
}

void drawBricks() {  
  for(int brickNumber = blocks.size()-1; brickNumber>=0; brickNumber--) {
    Squares brick=blocks.get(brickNumber);
    brick.show(randColori(), randColori(), randColori());
    if(brick.toccato(b)){  
      score.addPoint();
      blocks.remove(brick);
      brick.show(randColori(), randColori(), randColori());
    }else{
      brick.show(randColori(), randColori(), randColori());
    }
  }
}

void keyPressed(){
  if(keyCode==UP){
    if(b.getXSpeed()<6 && b.getYSpeed()<6 && b.getXSpeed()>-6 && b.getYSpeed()>-6 && b.getX()-b.getD()/2>0 && b.getX()+b.getD()/2<550 ){
       if(b.getXSpeed()<0 && b.getYSpeed()<0 && b.getY()-b.getD()/2>height/30+3){
          b.setXSpeedDim();
          b.setYSpeedDim();
      }
      if(b.getXSpeed()>0 && b.getYSpeed()<0 && b.getY()-b.getD()/2>height/30+3){
          b.setXSpeed();
          b.setYSpeedDim();
      }
      if(b.getXSpeed()<0 && b.getYSpeed()>0 && b.getY()-b.getD()/2>height/30+3){
          b.setXSpeedDim();
          b.setYSpeed();
      }
      if(b.getXSpeed()>0 && b.getYSpeed()>0 && b.getY()-b.getD()/2>height/30+3){
          b.setXSpeed();
          b.setYSpeed();
      }   
    }
  }
  if(keyCode==DOWN){
    if(b.getXSpeed()>3 && b.getYSpeed()>3 || b.getXSpeed()<=-3 && b.getYSpeed()<-3 || b.getXSpeed()<-3 && b.getYSpeed()>3 || b.getXSpeed()>3 && b.getYSpeed()<-3 ){
       if(b.getXSpeed()<0 && b.getYSpeed()<0 && b.getY()-b.getD()/2>height/30){
          b.setXSpeed();
          b.setYSpeed();
      }
      if(b.getXSpeed()>0 && b.getYSpeed()<0 && b.getY()-b.getD()/2>height/30){
          b.setXSpeedDim();
          b.setYSpeed();
      }
      if(b.getXSpeed()<0 && b.getYSpeed()>0 && b.getY()-b.getD()/2>height/30){
          b.setXSpeed();
          b.setYSpeedDim();
      }
      if(b.getXSpeed()>0 && b.getYSpeed()>0 && b.getY()-b.getD()/2>height/30){
          b.setXSpeedDim();
          b.setYSpeedDim();
      }
    }
  }
}


void mousePressed()
{
  song1.stop();
  song2.stop();
  song3.stop();
  gameOver = false;
  victory = false;
  blocks.clear();
  
  setup();
}
