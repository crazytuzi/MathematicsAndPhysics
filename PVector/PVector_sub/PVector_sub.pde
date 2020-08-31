PVector v1, v2;

void setup() {
  size(400, 300);

  noLoop();

  v1 = new PVector(240, 222, 0);

  v2 = new PVector(80, 170, 0);
}

void draw() {
  // 以向量v1的数值为圆心,绘制半径为40的圆(右下角)
  ellipse(v1.x, v1.y, 40, 40);

  // 以向量v2的数值为圆心,绘制半径为40的圆(左下方)
  ellipse(v2.x, v2.y, 40, 40);

  // 以向量v1和v2之差为圆心,绘制半径为80的圆(中上部)
  v1.sub(v2);

  ellipse(v1.x, v1.y, 80, 80);
}
