ArrayList<Draggable_item> items = new ArrayList<Draggable_item>();


void setup()
{
  size(600,600);
  background(255);
  items.add(new Draggable_item(new PVector(0,0), "sticky-note.jpg", "Sticky"));
}

void draw()
{
  background(255);
  for(int i = 0; i < items.size(); i++)
  {
   items.get(i).display(); 
  }
}

void mouseDragged()
{
 for(int i = 0; i < items.size(); i++)
 {
  items.get(i).move();
 } 
}
