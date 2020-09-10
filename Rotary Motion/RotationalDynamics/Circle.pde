class Circle {
  float mass;

  PVector center;

  float angle = 0;

  float aVelocity = 0;

  float aAcceleration = 0;

  // holds the offset for when object is clicked on
  PVector dragOffset;

  PVector startPointOfDragging;

  PVector endPointOfDragging;

  boolean dragging;

  boolean iFinished;

  Circle(float m) {
    mass = m;

    center = new PVector(width / 2, height / 2);

    dragOffset = new PVector(0.0, 0.0);

    startPointOfDragging = new PVector(0, 0);

    endPointOfDragging = new PVector(0, 0);

    dragging = false;

    iFinished = false;
  }

  void update() {
    aVelocity += aAcceleration;

    angle += aVelocity;

    aAcceleration = 0;
  }

  void display() {
    stroke(0);

    fill(175, 200);

    translate(width / 2, height / 2);

    rotate(angle);

    ellipse(0, 0, mass, mass);

    if (dragging) {
      stroke(#FF7F24);

      fill(#FF7F24);

      ellipse(startPointOfDragging.x - width / 2, startPointOfDragging.y - height / 2, 15, 15);
    }

    if (!dragging && iFinished) {
      stroke(#545454);

      fill(#545454);

      line(startPointOfDragging.x - width / 2, startPointOfDragging.y - height / 2, endPointOfDragging.x - width / 2, endPointOfDragging.y - height / 2);
    }
  }

  // The methods below are for mouse interaction
  void clicked(int mx, int my) {
    startPointOfDragging.set(mx, my);

    float d = startPointOfDragging.dist(center);

    if (d <= mass / 2) {
      dragging = true;
    } else {
      dragging = false;

      iFinished = false;
    }
  }

  void stopDragging(float mx, float my) {
    endPointOfDragging.set(mx, my);

    if (dragging) {
      dragging = false;

      iFinished = true;

      dragOffset = PVector.sub(endPointOfDragging, startPointOfDragging);

      float f = dragOffset.mag();

      PVector leverArm = PVector.sub(startPointOfDragging, center);

      float leverArmLength = leverArm.mag();

      float inertia = mass * leverArmLength * leverArmLength;

      float theta = PVector.angleBetween(leverArm, dragOffset);

      float torque = f * leverArmLength * sin(theta);

      if (theta < PI / 2) {
        torque *= -1;

        aAcceleration = torque / inertia;
      }
    }
  }
}
