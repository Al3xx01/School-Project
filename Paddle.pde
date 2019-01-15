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
    y=470;
    this.w=width/5;
    h=height/20;
    pSpeed=15;
  }
  
  public void show(){
    //x=mouseX;
      fill(0,255,0);
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
}
