public class Ball{
  
  private float x;
  private float y;
  private float d;
  private float xSpeed;
  private float ySpeed;
  
  public Ball(){
    
    x=100;      //posizione X centro
    y=100;     //posizione Y centro
    d=width/25;
    xSpeed=3;
    ySpeed=3;
  }
  
  public Ball(float x, float y, float d){
    
    this.x=x;      //posizione X centro
    this.y=y;     //posizione Y centro
    this.d=d;
    xSpeed=3;
    ySpeed=3;
  }
  
  public void update(){
    
    if(x>=width-d/2)
      xSpeed=-xSpeed;
    
    if(x<0+d/2)
      xSpeed=-xSpeed;
    
    if(y>height-d/2 || y<0+d/2)
      ySpeed=-ySpeed;
    
    x+=xSpeed;
    y+=ySpeed;
  }
  
  public void update(float xSpeed, float ySpeed){
    
    if(x>=width-d/2)
      this.xSpeed=-xSpeed;
    
    if(x<0+d/2)
      this.xSpeed=-xSpeed;
    
    if(y>height-d/2 || y<0+d/2)
      this.ySpeed=-ySpeed;
    
    x+=this.xSpeed;
    y+=this.ySpeed;
  }
  
  public void show(int trasparenza){
    stroke(255, 0, 0, trasparenza);
    fill(255,0,0, trasparenza);
    ellipse(x,y,d,d);
  }  
  
  public void show(float x, float y){
    stroke(0);
    fill(255,0,0);
    ellipse(x,y,d,d);
  }
  
  public void bounce(){
    ySpeed=-ySpeed;
  }
  
  public void stop(){
    x=width/2;        //posizione X standard a metà schermo
    y=height/2;       //posizione Y standard a metà schermo
    d=width/20;       //diametro palla proporzionato allo schermo  
    xSpeed=0;
    ySpeed=0;
 }
 
 public void pausa(float x, float y, float d){
    this.x=x;        //posizione X standard a metà schermo
    this.y=y;       //posizione Y standard a metà schermo
    this.d=d;       //diametro palla proporzionato allo schermo  
    xSpeed=0;
    ySpeed=0;
 }
  
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  public float getD(){
    return d;
  }
  
  public void setXSpeed(){
    this.xSpeed++;
  }
  
  public void setXSpeedDim(){
    this.xSpeed--;
  }
  
  public void setYSpeed(){
    this.ySpeed++;
  }
  
  public void setYSpeedDim(){
    this.ySpeed--;
  }
  
  public float getXSpeed(){
    return xSpeed;
  }
  
  public float getYSpeed(){
    return ySpeed;
  }
}
  
