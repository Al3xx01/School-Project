public class Paddle{
  
  private float x;
  private int y;
  private int w;
  private int h;
  private int pSpeed;
  private float x0;
  
  public Paddle(){
    
    x0=width/2.5 - w;
    x=x0;
    y=520;
    this.w=110;
    h=27;
    pSpeed=15;
  }
  
  public void show(){
      stroke(255, 255, 255, 50);
      fill(255,255,255,50);
      rect(x,y,w,h);
  }
  
  public float getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
  
  public int getW(){
    return w;
  }
  
  public int getH(){
    return h;
  }
  
  public void moveLeft(){
    x-=pSpeed;
  }
  
  public void moveRight(){
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
      if(pBase.getX()+pBase.getW()>b.getX() && pBase.getX()<b.getX() && (b.getY() + b.getD()/2)>=pBase.getY()){
          b.ySpeed+=randY();
          b.xSpeed+=randX();
          b.bounce();
      }else{
        if(!(pBase.getX()+pBase.getW()>b.getX() && pBase.getX()<b.getX()) && (b.getY() + b.getD()/2)>=pBase.getY() + 10){
          song2.stop();
          song3.play();  
          b.stop();
          gameOver = true;
        }       
      }
  }  
}
