void setup() {
  size(200, 110, P3D);
}

void draw() {
  translate(58, 48, 0);

  rotateY(0.5);

  noFill();

  // 左侧立方体
  box(40);

  translate(88, 48, 0);

  rotateY(0.5);

  noFill();

  // 右侧长方体
  box(40, 20, 50);
}
