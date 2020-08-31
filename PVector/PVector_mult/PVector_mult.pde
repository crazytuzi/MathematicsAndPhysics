PVector v;

void setup() {
  size(300, 300);

  noLoop();

  v = new PVector(50, 50, 0);
}

void draw() {
  // 以向量v的数值为圆心,绘制半径为40的圆(左上方)
  ellipse(v.x, v.y, 40, 40);

  // 以向量v和标量3的乘积结果为圆心,绘制半径为60的圆
  v.mult(3);

  ellipse(v.x, v.y, 60, 60);
}
