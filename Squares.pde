public class Squares
{
  private float x;
  private int y;
  private int w;
  private int h;
  private int pSpeed;
  private float x0;
  
  public Squares(int x, int y)
  {
    this.x=x;
    this.y=y;
    w=width/10;
    h=height/30;
  }
  
  public void show()
  {
    fill(255,0,0);
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
  
  public boolean toccato (Ball b){
    if ((b.getX()+b.getD()/4>x && b.getX()-b.getD()/4<x+w)
          && (b.getY()-b.getD()/4<(y+h) && b.getY()-b.getD()/4>y)){
          b.ySpeed=abs(b.ySpeed);
          return true;
    }
        //collides with top of block
    if ((b.getX()+b.getD()/4>x && b.getX()-b.getD()/4<x+w)
      && (b.getY()+b.getD()/2<y+h && b.getY()+b.getD()/2>y)) {
        b.ySpeed=-abs(b.ySpeed);
        return true;
      }
      
     //collides with Left side of block
    else if ((b.getY()+b.getD()/4>y && b.getY()-b.getD()/4<y+h)
      && (b.getX()+b.getD()/2>x && b.getX()+b.getD()/2<x+w)) {
        b.xSpeed=-abs(b.xSpeed);
        return true;
      }
 
    //collides with Right side of block
   if ((b.getY()+b.getD()/4>y && b.getY()-b.getD()/4<y+h)
      && (b.getX()-b.getD()/2<x+w && b.getX()-b.getD()/2>x)) {
        b.xSpeed=abs(b.xSpeed);
        return true;
      }
  return false;
  }


 


}
