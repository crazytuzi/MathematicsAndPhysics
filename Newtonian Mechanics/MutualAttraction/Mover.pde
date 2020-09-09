class Mover {
  // location
  PVector location;

  // velocity
  PVector velocity;

  // acceleration
  PVector acceleration;

  // Mass is tied to size
  float mass;

  Mover(float m, float x, float y) {
    mass = m;

    location = new PVector(x, y);

    velocity = new PVector(0, 0);

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

    fill(0, 100);

    ellipse(location.x, location.y, mass * 24, mass * 24);
  }

  PVector attract(Mover m) {
    // Calculate direction of force
    PVector force = PVector.sub(location, m.location);

    // Distance between objects
    float distance = force.mag();

    // Limiting the distance to eliminate "extreme" results for very close or very far objects
    distance = constrain(distance, 5.0, 25.0);

    // Normalize vector (distance doesn't matter here, we just want this vector for direction
    force.normalize();

    // Calculate gravitional force magnitude
    float strength = (g * mass * m.mass) / (distance * distance);

    // Get force vector --> magnitude * direction
    force.mult(strength);

    return force;
  }

  // Bounce off bottom of window
  void checkEdges() {
    if (location.x > width - mass * 12) {
      velocity.x *= -1;

      location.x = width - mass * 12;
    } else if (location.x < mass * 12) {
      velocity.x *= -1;

      location.x = mass * 12;
    }

    if (location.y > height - mass * 12) {
      velocity.y *= -1;

      location.y = height - mass * 12;
    } else if (location.y < mass * 12) {
      velocity.y *= -1;

      location.y = mass * 12;
    }
  }
}
