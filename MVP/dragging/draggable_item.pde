class Draggable_item
{
  private PVector location;
  private PVector size;
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
   image(img, location.x, location.y);
 }

 public void move()
 {
   if(pmouseX > location.x && pmouseX < location.x + size.x && pmouseY > location.y && pmouseY < location.Y + size.y)
   {
     location = new PVector(mouseX, mouseY);
   }
 } 
}
