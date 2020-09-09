class Attractor {
  // Mass, tied to size
  float mass;

  // Gravitational Constant
  float G;

  // Location
  PVector location;

  // Is the object being dragged?
  boolean dragging = false;

  // Is the mouse over the ellipse?
  boolean rollover = false;

  // holds the offset for when object is clicked on
  PVector dragOffset;

  Attractor() {
    location = new PVector(width / 2, height / 2);

    mass = 20;

    G = 1;

    dragOffset = new PVector(0.0, 0.0);
  }

  PVector attract(Mover m) {
    // Calculate direction of force
    PVector force = PVector.sub(location, m.location);

    // Distance between objects
    float d = force.mag();

    // Limiting the distance to eliminate "extreme" results for very close or very far objects
    d = constrain(d, 5.0, 25.0);

    // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    force.normalize();

    // Calculate gravitional force magnitude
    float strength = (G * mass * m.mass) / (d * d);

    // Get force vector --> magnitude * direction
    force.mult(strength);

    return force;
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);

    strokeWeight(4);

    stroke(0);

    if (dragging) {
      fill(50);
    } else if (rollover) {
      fill(100);
    } else {
      fill(175, 200);
    }

    ellipse(location.x, location.y, mass * 2, mass * 2);
  }

  // The methods below are for mouse interaction
  void clicked(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);

    if (d < mass) {
      dragging = true;

      dragOffset.x = location.x - mx;

      dragOffset.y = location.y - my;
    }
  }

  void hover(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);

    if (d < mass) {
      rollover = true;
    } else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag() {
    if (dragging) {
      location.x = mouseX + dragOffset.x;

      location.y = mouseY + dragOffset.y;
    }
  }
}
