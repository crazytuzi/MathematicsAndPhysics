// two lines, one line is fixed, the other has one end to be fixed
// 1st point x y
float ax = 50, ay = 50;

// 2nd point x y
float bx = 200, by = 300;

// 3rd point x y
float cx = 350, cy = 80;

// 4th point x y
float dx, dy;

// the intersection point between two lines
PVector xPoint = new PVector(0, 0);

float epson = 1.0e-6;

void setup() {
  size(400, 400);

  ellipseMode(RADIUS);

  strokeWeight(6);

  smooth();
}

void draw() {
  background(204);

  // set the other end of the line
  dx = mouseX;

  dy = mouseY;

  // check intersections
  PVector line1_End1 = new PVector(ax, ay);

  PVector line1_End2 = new PVector(bx, by);

  PVector line2_End1 = new PVector(cx, cy);

  PVector line2_End2 = new PVector(dx, dy);

  boolean isX = lineLineIntersect(line1_End1, line1_End2, line2_End1, line2_End2);

  if (isX == true) {
    stroke(255);
  } else {
    stroke(0);
  }

  // draw lines
  line(ax, ay, bx, by);

  line(cx, cy, dx, dy);

  // if the two lines intersects, draw the intersection points
  if (isX == true) {
    fill(255, 38, 0);

    ellipse(xPoint.x, xPoint.y, 10, 10);
  }
}

// check the intersection between two line
// x1,y1,x2,y2----the first line
// x3,y3,x4,y4----the second line
// xPnt----use the static parameter to store the intersection point if it exists
boolean lineLineIntersect(PVector line1_End1, PVector line1_End2, PVector line2_End1, PVector line2_End2) {
  boolean over = false;

  // line1
  PVector d1 = PVector.sub(line1_End2, line1_End1);

  float d1_mag = d1.mag();

  d1.normalize();

  PVector d2 = PVector.sub(line2_End2, line2_End1);

  float d2_mag = d2.mag();

  d2.normalize();

  // d1xd2
  PVector cross = d1.cross(d2);

  float magSqrt = cross.magSq();

  // these 2 ray parallel or interlap
  if (abs(sqrt(magSqrt))<epson) {
    return false;
  } else {
    // p2-p1
    PVector tV = PVector.sub(line2_End1, line1_End1);

    // (p2-p1)xd2
    PVector tV1 = tV.cross(d2);

    float t1 = tV1.dot(cross)/magSqrt;

    PVector tV2 = tV.cross(d1);

    float t2 = tV2.dot(cross)/magSqrt;

    if (t1 >= 0 && t1 <= d1_mag && t2 >= 0 && t2 <= d2_mag) {
      over = true;

      d1.mult(t1);

      xPoint = PVector.add(d1, line1_End1);
    }
  }

  return over;
}
