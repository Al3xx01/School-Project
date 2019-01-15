import java.util.Vector;
Ball b;
Paddle pBase;
Score score;
Vector<Squares> blocks= new Vector<Squares>();
boolean gameOver = false;

void setup() 
{
  size(500, 500);
  b = new Ball();
  pBase = new Paddle();

  score  = new Score();
  textSize(30);
  for(int k=0; k<=500; k+=width/10){
      blocks.add(new Squares(k, 0));
  }
  
}

void draw() 
{
  background(100);
  stroke(255);
  strokeWeight(2);
  fill(255, 153, 51);
  rect(0,0,width,height);
  b.update();
  b.show();
  pBase.show();
  pBase.movePaddle();
  fill(255,0,0);
  score.show("Score: ", 170, 420);
  drawBricks();
  if(pBase.getX()+pBase.getW()>b.getX() && pBase.getX()<b.getX() && (b.getY() + b.getD()/2)>=pBase.getY()){
      b.bounce();
  }else{
      if(!(pBase.getX()+pBase.getW()>b.getX() && pBase.getX()<b.getX()) && (b.getY() + b.getD()/2)>=pBase.getY() + 10){
            b.stop();
            gameOver = true;
      } 
      
  }
  
  
  
  
  if(gameOver){
    text("Game Over! Click to try again!", 45, 150);
  }
  
//PUNTEGGIO
  if(score.getPoints()>=100)
  {
    text("You won! Click to play again!", 45, 150);
    b.stop();
  }
  
}



void drawBricks() {  
  
  for(int brickNumber = blocks.size()-1; brickNumber>=0; brickNumber--) {
    Squares brick=blocks.get(brickNumber);
    brick.show();
    if(brick.toccato(b)){  
      score.addPoint();
      blocks.remove(brick);
      brick.show();
    }else{
      brick.show();
    }
  }
}

void keyPressed()
{
  if(keyCode==UP)
  {
    if(b.getXSpeed()<12 && b.getYSpeed()<12 ){
       if(b.getXSpeed()<0 && b.getYSpeed()<0 && b.getY()-b.getD()/2>0 && b.getX()-b.getD()/2>0 && b.getX()+b.getD()/2<500){
          b.setXSpeedDim();
          b.setYSpeedDim();
      }
      if(b.getXSpeed()>0 && b.getYSpeed()<0 && b.getY()-b.getD()/2>0 && b.getX()-b.getD()/2>0 && b.getX()+b.getD()/2<500){
          b.setXSpeed();
          b.setYSpeedDim();
      }
      if(b.getXSpeed()<0 && b.getYSpeed()>0 && b.getY()-b.getD()/2>0 && b.getX()-b.getD()/2>0 && b.getX()+b.getD()/2<500){
          b.setXSpeedDim();
          b.setYSpeed();
      }
      if(b.getXSpeed()>0 && b.getYSpeed()>0 && b.getY()-b.getD()/2>0 && b.getX()-b.getD()/2>0 && b.getX()+b.getD()/2<500){
          b.setXSpeed();
          b.setYSpeed();
      }
      
    }

  }
  if(keyCode==DOWN){
    if(b.getXSpeed()>=3 && b.getYSpeed()>=3 || b.getXSpeed()<=-3 && b.getYSpeed()<=-3){
       if(b.getXSpeed()<0 && b.getYSpeed()<0 && b.getY()-b.getD()/2>0 && b.getX()-b.getD()/2>0 && b.getX()+b.getD()/2<500){
          b.setXSpeed();
          b.setYSpeed();
      }
      if(b.getXSpeed()>0 && b.getYSpeed()<0 && b.getY()-b.getD()/2>0 && b.getX()-b.getD()/2>0 && b.getX()+b.getD()/2<500){
          b.setXSpeedDim();
          b.setYSpeed();
      }
      if(b.getXSpeed()<0 && b.getYSpeed()>0 && b.getY()-b.getD()/2>0 && b.getX()-b.getD()/2>0 && b.getX()+b.getD()/2<500){
          b.setXSpeed();
          b.setYSpeedDim();
      }
      if(b.getXSpeed()>0 && b.getYSpeed()>0 && b.getY()-b.getD()/2>0 && b.getX()-b.getD()/2>0 && b.getX()+b.getD()/2<500){
          b.setXSpeedDim();
          b.setYSpeedDim();
      }
      
    }
 }
}

/*void keyPressed()
{
  if(keyCode==LEFT && pBase.getX()>0)
  {
    pBase.moveLeft();
  }
  if(keyCode==RIGHT && pBase.getX() + pBase.getW()<500)
  {
    pBase.moveRight();
  }
}*/



void mousePressed()
{
  gameOver = false;
  blocks.clear();
  setup();
}
