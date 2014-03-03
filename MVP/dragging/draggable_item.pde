class Draggable_item
{
  private PVector location;
  private PVector size;
  private PVector smallsize = new PVector(100, 100);
  private PImage img;
  private String name;
  
  public Draggable_item(PVector location, String filename, String objectname)
 {
  this.location = location;
  img = loadImage(filename);
  size = new PVector(img.width, img.height);
  name = objectname;
 }

 public void display()
 {
   image(img, location.x, location.y, smallsize.x, smallsize.y);
 }

 public void move(float pmx, float pmy, float mx, float my)
 {
   if(pmx > location.x && pmx < location.x + smallsize.x && pmy > location.y && pmy < location.y + smallsize.y)
   {
     location = new PVector(mx-smallsize.x/2, my-smallsize.y/2);
   }
 } 
}
