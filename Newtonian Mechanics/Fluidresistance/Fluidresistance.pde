Mover mover;

Liquid liquid;

void setup() {
  size(640, 360);

  reset();

  // Create mover object
  mover = new Mover(random(0.5, 5), random(100, width - 100), 0);

  // Create liquid object

  liquid = new Liquid(0, height / 2, width, height / 2, 0.2);
}

void draw() {
  background(255);

  // Draw water
  liquid.display();

  if (liquid.contains(mover)) {
    // Calculate drag force
    PVector dragForce = liquid.drag(mover);

    // Apply drag force to Mover
    mover.applyForce(dragForce);
  }

  // Gravity is scaled by mass here!
  PVector gravity = new PVector(0, 0.1 * mover.mass);

  // Apply gravity
  mover.applyForce(gravity);

  // Update and display
  mover.update();

  mover.display();

  mover.checkEdges();
}

void mousePressed() {
  reset();
}

// Restart all the Mover objects randomly
void reset() {
  mover = new Mover(random(0.5, 5), mouseX, 0);
}
