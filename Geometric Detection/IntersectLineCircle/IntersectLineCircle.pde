// the input circle
float circleX = 200, circleY = 200, circleRadius = 100;

// the input line with 2 ends
float lineX1 = 350, lineY1 = 350;

float lineX2, lineY2;

// the intersection point between the circle and the line
PVector xPoint = new PVector(0, 0);

void setup() {
  size(400, 400);

  ellipseMode(RADIUS);

  smooth();
}

void draw() {
  background(204);

  // set the other end of the input line
  lineX2 = mouseX;

  lineY2 = mouseY;

  boolean isX = circleLineIntersect(lineX1, lineY1, lineX2, lineY2, circleX, circleY, circleRadius);

  if (isX == true) {
    fill(0);
  } else {
    fill(255);
  }

  // draw the circle and the line
  ellipse(circleX, circleY, circleRadius, circleRadius);

  line(lineX1, lineY1, lineX2, lineY2);

  // if these two intersects, draw the intersection point
  if (isX == true) {
    fill(255, 38, 0);

    ellipse(xPoint.x, xPoint.y, 5, 5);
  }
}

// check the intersection between the circle and the line
// x1,y1,x2,y2----two ends of the line
// cx,cy----circle center
// cr----circle radius
boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr) {
  boolean isX = false;

  PVector d = new PVector(x2 - x1, y2 - y1);

  float rayLength = d.mag();

  d.normalize();

  PVector e = new PVector(cx - x1, cy - y1);

  float a = d.dot(e);

  float eLength = e.mag();

  float tp = cr * cr - eLength * eLength + a * a;

  if (tp < 0) {
    isX = false;
  } else {
    float t = a - sqrt(tp);

    if (t >= 0 && t <= rayLength) {
      isX = true;

      float tpX = x1 + t * d.x;

      float tpY = y1 + t * d.y;

      xPoint.set(tpX, tpY, 0);
    }
  }

  return isX;
}
