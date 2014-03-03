ArrayList<Draggable_item> items = new ArrayList<Draggable_item>();

void setup()
{
  size(600,600);
  background(255);
}

void draw()
{
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
