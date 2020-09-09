class Mover {
  // location
  PVector location;

  // velocity
  PVector velocity;

  // acceleration
  PVector acceleration;

  // Mass is tied to size
  float mass;

  Mover() {
    mass = 1;

    location = new PVector(400, 50);

    velocity = new PVector(1, 0);

    acceleration = new PVector(0, 0);
  }

  // Newton's 2nd law: F = m * a
  // or  a = F / m
  void applyForce(PVector force) {
    // Divide by mass
    PVector f = PVector.div(force, mass);

    // Accumulate all forces in acceleration
    acceleration.add(f);
  }

  void update() {
    // Velocity changes according to acceleration
    velocity.add(acceleration);

    // Location changes by velocity
    location.add(velocity);

    // We must clear acceleration each frame
    acceleration.mult(0);
  }

  // Draw Mover
  void display() {
    stroke(0);

    strokeWeight(2);

    fill(127);

    ellipse(location.x, location.y, mass * 16, mass * 16);
  }

  // Bounce off bottom of window
  void checkEdges() {
    if (location.x > width) {
      velocity.x *= -1;

      location.x = width;
    } else if (location.x < 0) {
      velocity.x *= -1;

      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;

      location.y = height;
    }
  }
}
