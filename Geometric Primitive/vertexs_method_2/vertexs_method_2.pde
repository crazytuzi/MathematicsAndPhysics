void setup() {
  size(200, 200);
}

void draw() {
  noFill();

  beginShape();

  vertex(40, 40);

  vertex(160, 40);

  vertex(160, 160);

  vertex(40, 160);

  endShape(CLOSE);
}
