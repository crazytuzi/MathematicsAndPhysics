class Sphere {
  // Position, velocity vectors
  PVector position;

  PVector velocity;

  // Also using PVector to hold rotation values for 3 axes
  PVector rotation;

  // Vertices of the cube
  PVector[] centers = new PVector[1];

  // radius
  float r;

  // colors for faces of cube
  color cl = color(102);

  Sphere(float rIn) {
    this.r = rIn;

    // Start in center
    position = new PVector();

    // Random velocity vector
    velocity = PVector.random3D();

    velocity.mult(2);

    // Random rotation
    rotation = new PVector(random(40, 100), random(40, 100), random(40, 100));
  }

  // Sphre shape itself
  void drawSphere() {
    // Draw Sphere
    float rColor = random(0, 255);

    float gColor = random(0, 255);

    float bColor = random(0, 255);

    fill(rColor, gColor, bColor);

    sphere(r);
  }

  // Update location
  void update() {
    position.add(velocity);

    // check collision with 6 planes
    if (XWithPlane(1) || XWithPlane(2)) {
      velocity.y *= -1;
    }

    if (XWithPlane(3) || XWithPlane(4)) {
      velocity.z *= -1;
    }

    if (XWithPlane(5) || XWithPlane(6)) {
      velocity.x *= -1;
    }
  }


  boolean XWithPlane(int whichPlane) {
    boolean isX = false;

    PVector tpNormal = new PVector(0, 0, 0);

    float d = bounds / 2;

    switch(whichPlane) {
    case 1: // case 1: top plane, N(0, 1, 0)
      tpNormal.set(0, 1, 0);
      break;

    case 2: // case 2: bottom plane, N(0, -1, 0)
      tpNormal.set(0, -1, 0);
      break;

    case 3: // case 3: front plane, N(0, 0, -1)
      tpNormal.set(0, 0, -1);
      break;

    case 4: // case 4: back plane, N(0, 0, 1)
      tpNormal.set(0, 0, 1);
      break;

    case 5: // case 5: right plane, N(-1, 0, 0)
      tpNormal.set(-1, 0, 0);
      break;

    case 6: // case 6: left plane, N(1, 0, 0)
      tpNormal.set(1, 0, 0);
      break;

    default:
      break;
    }

    float tp = position.dot(tpNormal) - d;

    if (tp <= r && tp >= -r) {
      isX = true;
    }

    return isX;
  }

  // Display method
  void display() {
    pushMatrix();

    translate(position.x, position.y, position.z);

    rotateX(frameCount * PI / rotation.x);

    rotateY(frameCount * PI / rotation.y);

    rotateZ(frameCount * PI / rotation.z);

    noStroke();

    // Farm out shape to another method
    drawSphere();

    popMatrix();
  }
}
