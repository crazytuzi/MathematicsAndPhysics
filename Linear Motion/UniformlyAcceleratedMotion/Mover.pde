class Mover {
  // The Mover tracks location, velocity, and acceleration
  PVector location;

  PVector velocity;

  // The Mover's maximum speed
  float maxspeed;

  Mover() {
    // Start in the center
    location = new PVector(width / 2, height/2);

    velocity = new PVector(0, 0);

    maxspeed = 5;
  }

  void update() {
    // Compute a vector that points from location to mouse
    PVector mouse = new PVector(mouseX, mouseY);

    PVector acceleration = PVector.sub(mouse, location);

    // Set magnitude of acceleration
    acceleration.setMag(0.2);

    // Velocity changes according to acceleration
    velocity.add(acceleration);

    // Limit the velocity by maxspeed
    velocity.limit(maxspeed);

    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    stroke(255);

    strokeWeight(2);

    fill(127);

    ellipse(location.x, location.y, 48, 48);
  }
}
