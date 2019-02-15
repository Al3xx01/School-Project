import java.util.Vector;
import java.lang.Math;
import java.util.Random;
import processing.sound.*;
Ball b;
PImage bg;
Paddle pBase;
Score score;
Vector<Squares> blocks= new Vector<Squares>();
boolean gameOver = false;
boolean victory = false;
SoundFile song1;
SoundFile song2;
SoundFile song3;
String gameover = "songs/Wasted.aiff";
String main = "songs/Dub-Irish.mp3";
String vittoria = "songs/Mission-Passed.aiff";
Random random = new Random();
private static boolean stop=false;
private int trasparenza = 220;

int red;
int green;
int blue;

void setup() {
  
  bg = loadImage("MindArkanoid.jpg");
  gameOver = false;
  blocks.clear();
  size(550, 550);
  b = new Ball();
  pBase = new Paddle();

  score  = new Score();
  textSize(30);
  song1 = new SoundFile(this,vittoria);
  song2 = new SoundFile(this,main);
  song3 = new SoundFile(this,gameover);
  for(int j=0;j<(height/30)*3;j+=(height/30+10)){
      for(int k=0; k<=500; k+=width/10){
          blocks.add(new Squares(k, j));
      } 
  }
  song2.play();
  
  
}

void draw() {
  background(bg);
  b.update();
  b.show(trasparenza);
  pBase.show();
  pBase.movePaddle();
  fill(255,255,255,200);
  score.show("Score: ", (width/2)-65, 500);
  
  drawBricks();
  //println("x=" + b.getXSpeed());
  //println("y=" + b.getYSpeed());
  pBase.TouchBall(b);
  
  if(gameOver){
    text("Game Over! Click to try again!", 60, 150);   
  }
  
//PUNTEGGIO
  if(blocks.size()<=0){
    text("You won! Click to play again!", 60, 150);
    b.stop();
  }
  
}

public int randColori() {
  return random.nextInt(255);
}

void drawBricks() {  
  for(int brickNumber = blocks.size()-1; brickNumber>=0; brickNumber--) {
    Squares brick=blocks.get(brickNumber);
    brick.show(randColori(),randColori(),randColori());
    if(brick.toccato(b)){  
      score.addPoint();
      blocks.remove(brick);
      brick.show(randColori(),randColori(),randColori());
    }else{
      brick.show(randColori(),randColori(),randColori());
    }
  }
}

void keyPressed(){
  
  
  if(keyCode==UP)
  {
    if(b.getXSpeed()<6 && b.getYSpeed()<6 && b.getXSpeed()>-6 && b.getYSpeed()>-6 && b.getX()-b.getD()/2>0 && b.getX()+b.getD()/2<500 ){
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
  
  if(keyCode=='q' || keyCode=='Q'){
    float xSpeed = b.getXSpeed();
    float ySpeed = b.getYSpeed();
    float d = b.getD();
    float x = b.getX();
    float y = b.getY();
    b.pausa(x, y, d);
  }
  
  if(keyCode=='w' || keyCode=='W'){
    float xSpeed = b.getXSpeed();
    float ySpeed = b.getYSpeed();
    float d = b.getD();
    float x = b.getX();
    float y = b.getY();
    b = new Ball(x, y, d);
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
  
  //Trasparenza ball
  if(keyCode == 'a' || keyCode=='A'){
    if(trasparenza >=120 && trasparenza <=220 ){
      trasparenza-=100;
      println(trasparenza);
      b.show(trasparenza);
    }
  }else{
    if(keyCode == 'd' || keyCode=='D'){
    if(trasparenza >=20 && trasparenza <=120){
      trasparenza+=100;
      b.show(trasparenza);
      System.out.println(trasparenza);
    }
  }
  }
}


void mousePressed(){
  
  song1.stop();
  song2.stop();
  song3.stop();
  setup();
}
