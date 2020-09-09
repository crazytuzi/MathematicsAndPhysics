boolean iLinked = false;

// Variables related to moving box
PVector centerRBox;

PVector velocityRBox;

PVector centerLBox;

PVector velocityLBox;

float boxHeight = 50;

float epsilon = 0.5;

float mLeft = 100;

float mRight = 100;

void setup() {
  size(1200, 600);

  centerRBox = new PVector(3 * width / 4 - mRight / 2, 3 * height / 4 - boxHeight / 2);

  centerLBox = new PVector(mLeft / 2, 3 * height / 4 - boxHeight / 2);

  velocityLBox = new PVector(0, 0);

  velocityRBox = new PVector(0, 0);
}

void draw() {
  // draw background
  background(#F0FFF0);

  // draw base
  fill(#6C7B8B);

  noStroke();

  rect(0, 7 * height / 8, width, height / 4);

  // move Left Box
  centerLBox.add(velocityLBox);

  centerRBox.add(velocityRBox);

  noStroke();

  fill(199, 97, 20);

  rect( centerRBox.x, centerRBox.y, mRight, boxHeight);

  rect( centerLBox.x, centerLBox.y, mLeft, boxHeight);

  if (checkCollisionsBetween2Boxes()) {
    // calc V1f
    PVector v1 = velocityLBox.copy();

    PVector v2 = velocityRBox.copy();

    v1.mult((mLeft - mRight * epsilon) / (mLeft + mRight));

    v2.mult((1 + epsilon) * mRight / (mLeft + mRight));

    PVector v1f = PVector.add(v1, v2);

    // calc V2f
    v1 = velocityLBox;

    v2 = velocityRBox;

    v1.mult((1 + epsilon) * mLeft / (mLeft + mRight));

    v2.mult((mRight - epsilon * mLeft) / (mLeft + mRight));

    PVector v2f = PVector.add(v1, v2);

    // set back
    velocityLBox.set(v1f.x, v1f.y);

    velocityRBox.set(v2f.x, v2f.y);

    PVector testVec = PVector.sub(velocityLBox, velocityRBox);

    if ( testVec.mag() < 1.0e-4) {
      iLinked = true;
    } else {
      iLinked = false;
    }
  }

  checkCollistionWithBorders();
}

boolean checkCollisionsBetween2Boxes() {
  // collisions between 2 boxes
  float widthSum = (mLeft + mRight) / 2;

  float distance = centerRBox.dist(centerLBox);

  if (distance <= widthSum) {
    return true;
  } else {
    return false;
  }
}

void checkCollistionWithBorders() {
  if (!iLinked) {
    // the left Box moves towards the positive direction
    if (velocityLBox.x > 0)
    {
      float dist = centerLBox.x + mLeft / 2;

      if (dist >= width) {
        velocityLBox.set(-velocityLBox.x, 0);
      }
    }
    // the left Box moves towards the negative direction
    else {
      float dist = centerLBox.x - mLeft / 2;

      if (dist <= 0) {
        velocityLBox.set(-velocityLBox.x, 0);
      }
    }

    // the right Box moves towards the positive direction
    if (velocityRBox.x > 0)
    {
      float dist = centerRBox.x + mRight / 2;

      if (dist >= width) {
        velocityRBox.set(-velocityRBox.x, 0);
      }
    }
    // the right Box moves towards the negative direction
    else {
      float dist = centerRBox.x - mRight / 2;

      if (dist <= 0) {
        velocityRBox.set(-velocityRBox.x, 0);
      }
    }
  }
  // the left Box moves towards the positive direction
  else {
    if (velocityRBox.x > 0)
    {
      float dist = centerRBox.x + mRight / 2;

      if (dist >= width) {
        velocityRBox.set(-velocityRBox.x, 0);

        velocityLBox.set(-velocityLBox.x, 0);
      }
    }

    // the left Box moves towards the negative direction
    if (velocityLBox.x < 0)
    {
      float dist = centerLBox.x - mLeft / 2;

      if (dist <= 0) {
        velocityLBox.set(-velocityLBox.x, 0);

        velocityRBox.set(-velocityRBox.x, 0);
      }
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    // reset velocity of 2 Boxes
    epsilon = 0.5;

    mLeft = 100;

    mRight = 100;

    centerLBox.set(0, 0);

    centerRBox.set(0, 0);

    centerRBox = new PVector(3 * width / 4 - mRight / 2, 3 * height / 4 - boxHeight / 2);

    centerLBox = new PVector(mLeft / 2, 3 * height / 4 - boxHeight / 2);

    velocityLBox.set(0, 0);

    velocityRBox.set(0, 0);
  }

  if (key == 'a' || key == 'A') {
    velocityLBox.set(5, 0);
  }

  if (key == 'd' || key == 'D') {
    velocityRBox.set(-3, 0);
  }
}
