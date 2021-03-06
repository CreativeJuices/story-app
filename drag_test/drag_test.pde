// Click and Drag an object
// Daniel Shiffman 

Draggable d;

void setup() {
  size(600,600);
  smooth();
  d = new Draggable(50,50,60,25);
}

void draw() {
  background(255);
  d.rollover(mouseX,mouseY);
  d.drag(mouseX,mouseY);
  d.display();
}

void mousePressed() {
  d.clicked(mouseX,mouseY);
}

void mouseReleased() {
  d.stopDragging();
}
