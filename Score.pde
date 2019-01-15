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
  
  public int getPoints()
  {
    return points;
  }
  
  public void addPoint()
  {
    points+=10;
  }
}
