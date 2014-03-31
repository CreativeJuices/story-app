class Image
{
  private PVector position;
  private PVector size;
  private PImage img;
  
  public Image()
  {
   position = new PVector(width/2, height/2);
   size = new PVector(100, 100);
   img = loadImage("Electricsheep-14156.jpg");
  }
 
  public Image(float x, float y, float wx, float wy, String filename)
  {
    position = new PVector(x,y);
    size = new PVector(wx, wy);
    img = loadImage(filename);
  }
  
  public void display()
  {
   image(img, position.x, position.y, size.x, size.y); 
  }
  
  public void drag(float mx, float my)
  {
    if(mx > position.x && mx < position.x + size.x && my > position.y && my < position.y + size.y)
    {
      float diffx = abs(mx - position.x);
      float diffy = abs(my - position.y);
      
      
      position.x = mouseX - diffx;
      position.y = mouseY - diffy;
     
    } 
  }
}
