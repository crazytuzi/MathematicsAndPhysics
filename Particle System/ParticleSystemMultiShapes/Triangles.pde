class Triangles extends Particle {
  // We could add variables for only Confetti here if we so
  Triangles(PVector l) {
    super(l);
  }

  // Inherits update() from parent

  // Override the display method
  void display() {
    rectMode(CENTER);

    fill(random(255), random(255), random(255), lifespan);

    stroke(0, lifespan);

    strokeWeight(2);

    pushMatrix();

    translate(position.x, position.y);

    float theta = map(position.x, 0, width, 0, TWO_PI * 2);

    rotate(theta);

    triangle(0, 0, 0, 18, 10, 6 * sqrt(3));

    popMatrix();
  }
}
