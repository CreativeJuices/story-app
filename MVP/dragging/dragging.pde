ArrayList<Draggable_item> items = new ArrayList<Draggable_item>();
boolean drag = true;
PFont font;



void setup()
{
  size(1000,600);
  background(255);
  items.add(new Draggable_item(new PVector(50,450), "sticky-note.jpg", "Sticky"));
  items.add(new Draggable_item(new PVector(200,450), "academic-paper.jpg", "Paper 1"));
  items.add(new Draggable_item(new PVector(350, 450), "academic-paper.jpg", "Paper 2"));
  items.add(new Draggable_item(new PVector(500, 450), "notebook.png", "notebook 1"));
  items.add(new Draggable_item(new PVector(650, 450), "notebook.png", "notebook 2"));
  items.add(new Draggable_item(new PVector(800, 450), "notebook.png", "notebook 3"));
  font = loadFont("Serif-48.vlw");
  textFont(font, 48);
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
  rect( 50, 50, 425, 350);
  fill(0);
  text("Project 1", 50, 50);
  noFill();
  rect(500, 50, 425, 350);
  fill(0);
  text("Project 2", 500, 50);
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
