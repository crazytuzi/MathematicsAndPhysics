// 平面上四个点
PVector p1, p2, p3, p4;

void setup() {
  size(600, 600, P3D);

  // 预先定义四个点的位置，确保其共面
  p1 = new PVector(width / 4, height / 2, 0);

  p2 = new PVector(3 * width / 4, height / 2, 0);

  p3 = new PVector(3 * width / 4, height / 2, width / 2);

  p4 = new PVector(width / 4, height / 2, width / 2);
}

void draw() {
  smooth();

  background(120);

  lights();

  rotateX(-PI / 6);

  fill(#F4A460);

  noStroke();

  beginShape();

  vertex(p1.x, p1.y, p1.z);

  vertex(p2.x, p2.y, p2.z);

  vertex(p3.x, p3.y, p3.z);

  vertex(p4.x, p4.y, p4.z);

  endShape(CLOSE);
}
