public class Ball
{
  private float x;
  private float y;
  private int d;
  private int xSpeed;
  private int ySpeed;
  
  public Ball()
  {
    x=100;      //posizione X centro
    y=100;     //posizione Y centro
    d=width/25;
    xSpeed=3;
    ySpeed=3;
  }
  
  public void update()
  {
    if(x>=width-d/2)
    {
      xSpeed=-xSpeed;
    }
    
    if(x<0+d/2)
    {
      xSpeed=-xSpeed;
    }
    
    if(y>height-d/2 || y<0+d/2)
    {
      ySpeed=-ySpeed;
    }
    
    x+=xSpeed;
    y+=ySpeed;
  }
  
  public void show()
  {
    stroke(0);
    fill(255,0,0);
    ellipse(x,y,d,d);
  }  
  
  public void bounce()
  {
    ySpeed=-ySpeed;
  }
  
  public void stop()
  {
    x=width/2;        //posizione X standard a metà schermo
    y=height/2;       //posizione Y standard a metà schermo
    d=width/20;       //diametro palla proporzionato allo schermo  
    xSpeed=0;
    ySpeed=0;
    
 }
  
  public float getX()
  {
    return x;
  }
  
  public float getY()
  {
    return y;
  }
  
  public int getD()
  {
    return d;
  }
  
  public void setXSpeed()
  {
    this.xSpeed++;
  }
  
  public void setXSpeedDim()
  {
    this.xSpeed--;
  }
  
  public void setYSpeed()
  {
    this.ySpeed++;
  }
  
    public void setYSpeedDim()
  {
    this.ySpeed--;
  }
  
  public int getXSpeed()
  {
    return xSpeed;
  }
  
  public int getYSpeed()
  {
    return ySpeed;
  }
}
  
