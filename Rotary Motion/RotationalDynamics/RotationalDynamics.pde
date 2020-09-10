Circle circle;

void setup() {
  size(500, 500);

  background(255);

  circle = new Circle(300);
}

void draw() {
  background(255);

  circle.update();

  circle.display();
}

void mousePressed() {
  circle.clicked(mouseX, mouseY);
}

void mouseReleased() {
  circle.stopDragging(mouseX, mouseY);
}
