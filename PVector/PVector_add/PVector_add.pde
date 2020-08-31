PVector v1, v2;

void setup() {
  size(300, 300);

  noLoop();

  v1 = new PVector(100, 120, 0);

  v2 = new PVector(80, 50, 0);
}

void draw() {
  // 以向量v1的数值为圆心,绘制半径为60的圆(中部)
  ellipse(v1.x, v1.y, 60, 60);

  // 以向量v2的数值为圆心,绘制半径为40的圆(上部)
  ellipse(v2.x, v2.y, 40, 40);

  // 以向量v1和v2之和为圆心,绘制半径为80的圆(右下部)
  PVector v3 = PVector.add(v1, v2);

  ellipse(v3.x, v3.y, 80, 80);
}
