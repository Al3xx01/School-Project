public class Score
{
  private int points;
  
  public Score()
  {
    points=0;
  }
  
  public void show(String label, int x, int y)
  {
    text(label+points,x,y);
  }
  
 /* public boolean Victory()
  {
    if(points>=10){
      song2.stop();
      song3.play();
      return victory = true;
    }else{
      return victory = false;
    }
  }*/
  
  public void addPoint()
  {
    points+=10;
  }
}
