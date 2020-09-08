Mover mover;

void setup() {
  size(640, 360);

  mover = new Mover();
}

void draw() {
  background(0);

  // Update the location
  mover.update();

  // Display the Mover
  mover.display();
}
