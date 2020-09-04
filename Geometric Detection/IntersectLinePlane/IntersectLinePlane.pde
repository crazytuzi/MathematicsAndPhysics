// end of line (changed with arrow keys)
float lx, ly, lz;

// four points on the plane
PVector p1, p2, p3, p4;


// the intersection point - start at 0
float sx = 0, sy= 0, sz = 0;

// rotation variables (grab with mouse to move)
float rotX = -5.0, rotY = -12.0;

void setup() {
  size(600, 600, P3D);

  smooth();

  // initialization of the input point
  lx = width;

  ly = height;

  lz=  width;

  // initialization of the input plane
  p1 = new PVector(width / 5, height / 2, 0);

  p2 = new PVector(4 * width / 5, height/2, 0);

  p3 = new PVector(4 * width / 5, height / 2, 3 * width / 4);

  p4 = new PVector(width / 5, height / 2, 3 * width / 4);

  // three points on the plane, followed by ends of the line
  intersect(0, 0, 0, lx, ly, lz);
}

void draw() {
  background(32);

  lights();

  rotateX(rotY);

  rotateY(rotX);

  // draw the plane
  fill(#F4A460);

  noStroke();

  beginShape();

  vertex(p1.x, p1.y, p1.z);

  vertex(p2.x, p2.y, p2.z);

  vertex(p3.x, p3.y, p3.z);

  vertex(p4.x, p4.y, p4.z);

  endShape(CLOSE);

  // draw the line
  stroke(255);

  strokeWeight(2);

  line(0, 0, 0, lx, ly, lz);

  strokeWeight(1);

  // draw a dot at the intersection point!
  fill(255, 0, 0);

  noStroke();

  pushMatrix();

  translate(sx, sy, sz);

  sphere(5);

  popMatrix();
}

// arrow keys move the end of the line
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      lx += 10;
    } else if (keyCode == LEFT) {
      lx -= 10;
    } else if (keyCode == UP) {
      lz -= 10;
    } else if (keyCode == DOWN) {
      lz +=10;
    }
  }
}

// on release, check intersection again and print the result!
void keyReleased() {
  if (key == CODED) {
    intersect(0, 0, 0, lx, ly, lz);
  }
}

// mouse moves your view
void mouseDragged() {
  rotX += (mouseX - pmouseX) * 0.01;

  rotY -= (mouseY - pmouseY) * 0.01;
}

// three points on the plane, followed by ends of the line (x,y,z)
void intersect(float px, float py, float pz, float qx, float qy, float qz) {
  PVector p0 = new PVector(px, py, pz);

  PVector Q = new PVector(qx, qy, qz);

  // vector E from A to C
  PVector E = PVector.sub(p2, p1);

  // vector F from A to B
  PVector F = PVector.sub(p3, p1);

  // cross product of E and F
  PVector N = E.cross(F);

  N.normalize();

  // get ray direction vector
  PVector d = PVector.sub(Q, p0);

  d.normalize();

  // dot product of ray and normal
  // this tells us if the ray is pointing towards the plane
  float m = d.dot(N);

  // less than 0 means the vectors are opposed
  // more than 0 means the vectors point the same way
  // equal to 0 means they are perpendicular
  if (m < 0) {
    // cross product of E and F
    // E.cross(F);
    PVector planeN = N.copy();

    // d of the plane
    float plane_d = p1.dot(planeN);

    float t = plane_d - p0.dot(planeN);

    t /= m;

    sx = p0.x + t * d.x;

    sy = p0.y + t * d.y;

    sz = p0.z + t * d.z;
  }
}
