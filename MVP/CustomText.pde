public class CustomText
{
  String txt;
  PVector position;
  PVector size;
  
  
  public CustomText(String txt)
  {
    this.txt = txt;
    position = new PVector(width/2-textWidth(txt)/2, height/2);
    size = new PVector(textWidth(txt), 24);
  }
  
  public void display()
  {
   //textFont(myfont);
   text(txt, position.x, position.y);
  }
  
  public void drag(float mx, float my)
  {
    if(mx > position.x && mx < position.x + size.x && my < position.y && my > position.y - size.y)
    {
      float diffx = abs(mx - position.x);
      float diffy = abs(my - position.y);
      
      
      position.x = mouseX - diffx;
      position.y = mouseY + diffy;
     
    }
  }
}
