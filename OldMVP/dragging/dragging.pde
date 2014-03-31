class Draggable_item
{
  private PVector location;
  private PVector size;
  private PVector smallsize = new PVector(250, 250);
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

ArrayList<Draggable_item> items = new ArrayList<Draggable_item>();
boolean drag = true;
PFont font;



void setup()
{
  size(1600,900);
  background(255);
  items.add(new Draggable_item(new PVector(50,600), "sticky-note.jpg", "Sticky"));
  items.add(new Draggable_item(new PVector(400,600), "academic-paper.jpg", "Paper 1"));
  items.add(new Draggable_item(new PVector(650, 600), "academic-paper.jpg", "Paper 2"));
  items.add(new Draggable_item(new PVector(900, 600), "notebook.png", "notebook 1"));
  items.add(new Draggable_item(new PVector(1150, 600), "notebook.png", "notebook 2"));
  items.add(new Draggable_item(new PVector(1400, 600), "notebook.png", "notebook 3"));
  font = loadFont("Serif-48.vlw");
  textFont(font, 20);
}

void draw()
{
  if(drag)
  {
    background(255);
  }
  else
  {
    if(mousePressed)
    {
     line(pmouseX, pmouseY, mouseX, mouseY); 
    }
  }
  noFill();
  rect( 50, 50, 700, 500);
  fill(0);
  text("Project 1", 50, 50);
  noFill();
  rect(800, 50, 700, 500);
  fill(0);
  text("Project 2", 800, 50);
  fill(0);
  text("MyThinkSpace", 600, 25);
  for(int i = 0; i < items.size(); i++)
  {
   items.get(i).display(); 
  }
}

void mouseDragged()
{
  if(drag)
  {
  float pmx = pmouseX;
  float pmy = pmouseY;
  float mx = mouseX;
  float my = mouseY;
 for(int i = 0; i < items.size(); i++)
 {
   items.get(i).move(pmx, pmy, mx, my);
 } 
  }
}
 
void keyPressed()
{
 if(key == ' ')
 {
   drag = !drag;
 } 
}
