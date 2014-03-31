ArrayList<Image> items = new ArrayList<Image>(); 
ArrayList<CustomText> txt = new ArrayList<CustomText>();
ArrayList<ArrayList<PVector>> lines = new ArrayList<ArrayList<PVector>>();
PFont myfont;
boolean makeText = false;
String t = "";
boolean makeLine = false;
ArrayList<PVector> l = new ArrayList<PVector>();

void setup()
{
  size(900,600);
  myfont = loadFont("Serif-48.vlw");
  textFont(myfont,24);
  //items.add(new Image());
  fill(0);
}

void draw()
{
  fill(0);
  stroke(0);
  background(255);
  for(int i = 0; i < items.size(); i++)
  {
    items.get(i).display();
  }
  for(int i = 0; i < txt.size(); i++)
  {
    txt.get(i).display();
  }
  for(int i = 0; i < lines.size(); i++)
  {
    for(int j = 0; j < lines.get(i).size()-1; j++)
    {
      line(lines.get(i).get(j).x, lines.get(i).get(j).y, lines.get(i).get(j+1).x, lines.get(i).get(j+1).y);
    }
  }
  if(makeText)
  {
    fill(255, 0, 0);
    if(t != "")
    {
      text(t, width/2-textWidth(t)/2, height/2);
    }
    else
    {
      text("Type Your Text", width/2-textWidth("Type Your Text")/2, height/2);
    }
  }
  if(makeLine)
  {
    stroke(255, 0, 0);
    for(int i = 0; i < l.size()-1; i++)
    {
      line(l.get(i).x, l.get(i).y, l.get(i+1).x, l.get(i+1).y);
    }
  }
}

void keyPressed()
{
  if(makeText)
  {
    if((key >= 'a' && key <= 'z')|| (key >= 'A' && key <= 'Z') || key == ' ')
    {
      t += key;
    }
    else if(key == BACKSPACE)
    {
     t = t.substring(0, t.length()-1); 
    }
    else if(key == ENTER || key == RETURN)
    {
      makeText = false;
      txt.add(new CustomText(t));
      t = "";
    }
  }
  else if(key == 't')
    {
      makeText = true;
    }
  else if(key == 'w')
    {
      items.add(new Image(width/2, height/2, 100, 97.85, "word.png"));
    }
  else if(key == 'e')
    {
      items.add(new Image(width/2, height/2, 100, 100, "excel-8.png"));
    }
  else if(key == 'p')
    {
      items.add(new Image(width/2, height/2, 100,100, "pdf.png"));
    }
  else if(key == 'i')
    {
      items.add(new Image(width/2, height/2, 100, 100, "web.png"));
    }
  else if(key == 'l')
  {
    makeLine = !makeLine;
    if(!makeLine)
    {
      ArrayList<PVector> copy = (ArrayList)l.clone();
      lines.add(copy);
      l.clear();
    }
  }   
}

void mouseDragged()
{
  if(makeLine)
  {
    l.add(new PVector(pmouseX, pmouseY));
    l.add(new PVector(mouseX, mouseY));
  }
  else
  {
    for(int i = 0; i < txt.size(); i++)
    {
      txt.get(i).drag(pmouseX, pmouseY);
    }
    for(int i = 0; i < items.size(); i++)
    {
      items.get(i).drag(pmouseX, pmouseY);
    }
  }
}
