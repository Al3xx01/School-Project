public class Paddle
{
  private float x;
  private int y;
  private int w;
  private int h;
  private int pSpeed;
  private float x0;
  
  public Paddle()
  {
    x0=width/2.5 - w;
    x=x0;
    y=520;
    this.w=width/5;
    h=height/20;
    pSpeed=15;
  }
  
  public void show(int r, int g, int b){
    //x=mouseX;
      fill(255,255,255,80);
      rect(x,y,w,h);
  }
  
  public float getX()
  {
    return x;
  }
  
  public int getY()
  {
    return y;
  }
  
  public int getW()
  {
    return w;
  }
  
  public int getH()
  {
    return h;
  }
  
  public void moveLeft()
  {
    x-=pSpeed;
  }
  
  public void moveRight()
  {
    x+=pSpeed;
  }
  
  public void movePaddle(){
      x=mouseX;
  }
  
public float randY() {
  return (float)Math.random() * (0.3 + 0.3) - 0.3;
}

public float randX() {
  return (float)Math.random() * (0.3 + 0.3) - 0.3;
}
  
  public void TouchBall(Ball b){
          if(blocks.size()<=0){
            b.stop();
            victory = true;
          }else{
            victory = false;
          }
      if(pBase.getX()+pBase.getW()>b.getX() && pBase.getX()<b.getX() && (b.getY() + b.getD()/2)>=pBase.getY()){
          b.ySpeed+=randY();
          b.xSpeed+=randX();
          b.bounce();
      }else{
        if(!(pBase.getX()+pBase.getW()>b.getX() && pBase.getX()<b.getX()) && (b.getY() + b.getD()/2)>=pBase.getY() + 10){
          b.stop();
          song2.stop();
          song1.play();
          gameOver = true;
          
        }       
      }
  }  
}
