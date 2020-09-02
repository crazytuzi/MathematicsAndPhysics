void setup() {
  size(200, 200);
}

void draw() {
  beginShape(TRIANGLE_FAN);

  vertex(100, 100);

  vertex(100, 30);

  vertex(169, 100);

  vertex(100, 170);

  vertex(29, 100);

  vertex(100, 30);

  endShape();
}
