// the input point (changed with arrow keys)
float lx, ly, lz;

// four points on the plane
PVector p1, p2, p3, p4;

// the nearest point - start at 0
float sx = 0;

float sy = 0;

float sz = 0;

// check the control key
boolean isRightKeyPressed = false;

void setup() {
  size(600, 600, P3D);

  smooth();

  // initialization of the input point
  lx = width / 4;

  ly = height /4;

  lz = 0;

  // initialization of the input plane
  p1 = new PVector(width / 4, height / 2, 0);

  p2 = new PVector(3 * width /4, height / 2, 0);

  p3 = new PVector(3 * width / 4, height / 2, width / 2);

  p4 = new PVector(width / 4, height / 2, width / 2);

  // calculate the nearest point
  nearestPointOnPlane(lx, ly, lz);
}

void draw() {
  background(120);

  lights();

  rotateX(-PI / 6);

  // draw the plane
  fill(#F4A460);

  noStroke();

  beginShape();

  vertex(p1.x, p1.y, p1.z);

  vertex(p2.x, p2.y, p2.z);

  vertex(p3.x, p3.y, p3.z);

  vertex(p4.x, p4.y, p4.z);

  endShape(CLOSE);

  // draw the input point
  fill(0, 0, 0);

  noStroke();

  pushMatrix();

  translate(lx, ly, lz);

  sphere(7);

  popMatrix();

  // draw a dot at the nearest point!
  fill(255, 255, 255);

  noStroke();

  pushMatrix();

  translate(sx, sy, sz);

  sphere(7);

  popMatrix();
}

// use 6 keys to move the input point
void keyPressed() {
  // increase the x coordinate
  if (key == 'q' || key == 'Q') {
    isRightKeyPressed = true;

    lx += 10;
  }
  // decrease the x coordinate
  else if (key == 'w' || key == 'W') {
    isRightKeyPressed = true;
    lx -= 10;
  }
  // increase the y coordinate
  else if (key == 'a' || key == 'A') {
    isRightKeyPressed = true;

    ly += 10;
  }
  // decrease the y coordinate
  else if (key == 's' || key == 'S') {
    isRightKeyPressed = true;

    ly -= 10;
  }
  // increase the z coordinate
  else if (key == 'z' || key == 'Z') {
    isRightKeyPressed = true;

    lz += 10;
  }
  // decrease the z coordinate
  else if (key == 'x' || key == 'X') {
    isRightKeyPressed = true;

    lz -= 10;
  }
}

// on release, check the closest point on the plane again and print the result!
void keyReleased() {
  if (isRightKeyPressed) {
    nearestPointOnPlane(lx, ly, lz);
  }
}

// the input point (x,y,z)
// you can use p1, p2, p3, p4 to determine the plane directly as they are static parameters
// the nearest point will come out to be stored in these static parameters: sx,sy,sz  
void nearestPointOnPlane(float qx, float qy, float qz) {
  // vector E from A to C
  PVector E = PVector.sub(p2, p1);

  // vector F from A to B
  PVector F = PVector.sub(p3, p1);

  // cross product of E and F
  PVector N = E.cross(F);

  N.normalize();

  // d
  float d = p1.dot(N);

  // get the nearest point on plane
  PVector q = new PVector(qx, qy, qz);

  float tp = d - q.dot(N);

  N.mult(tp);

  q.add(N);

  sx = q.x;

  sy = q.y;

  sz = q.z;
}
