// Position of left hand side of floor
PVector base1;

// Position of right hand side of floor
PVector base2;

// Length of floor
float baseLength;

// Variables related to moving ball
PVector position;

PVector velocity;

float r = 6;

float speed = 3.5;

void setup() {
  size(640, 360);

  fill(128);

  base1 = new PVector(0, height - 150);

  base2 = new PVector(width, height);

  // start ellipse at middle top of screen
  position = new PVector(width / 2, 0);

  // calculate initial random velocity
  velocity = PVector.random2D();

  velocity.mult(speed);
}

void draw() {
  // draw background
  fill(0, 12);

  noStroke();

  rect(0, 0, width, height);

  // draw base
  fill(200);

  quad(base1.x, base1.y, base2.x, base2.y, base2.x, height, 0, height);

  // calculate base top normal
  PVector baseDelta = PVector.sub(base2, base1);

  baseDelta.normalize();

  PVector normal = new PVector(-baseDelta.y, baseDelta.x);

  // draw ellipse
  noStroke();

  fill(255);

  ellipse(position.x, position.y, r * 2, r * 2);

  // move elipse
  position.add(velocity);

  // detect and handle collision
  if (checkCollision(position)) {
    PVector incidence = PVector.mult(velocity, -1);

    // calculate dot product of incident vector and base top normal
    float dot = incidence.dot(normal);

    PVector pVec = PVector.mult(normal, dot);

    pVec.mult(2);

    // calculate reflection vector
    // assign reflection vector to direction vector
    velocity.add(pVec);

    // draw base top normal at collision point
    stroke(255, 128, 0);

    line(position.x, position.y, position.x - normal.x * 100, position.y - normal.y * 100);
  }

  boundaryCheck();
}

void boundaryCheck() {
  // detect boundary collision
  // right
  if (position.x > width - r) {
    velocity.x *= -1;

    position.x = width - r;
  }

  // left
  if (position.x < r) {
    velocity.x *= -1;

    position.x = r;
  }

  // top
  if (position.y < r) {
    velocity.y *= -1;

    position.y = r;

    // randomize base top
    base1.y = random(height - 100, height);

    base2.y = random(height -100, height);
  }
}

// Check whether the ball collides with the ground
boolean checkCollision(PVector pos) {
  PVector baseDirection = PVector.sub(base2, base1);

  baseDirection.normalize();

  PVector v = PVector.sub(pos, base1);

  float t = v.dot(baseDirection);

  baseDirection.mult(t);

  PVector closestPoint = PVector.add(base1, baseDirection);

  if (closestPoint.dist(pos) > r)
  {
    return false;
  } else {
    return true;
  }
}
