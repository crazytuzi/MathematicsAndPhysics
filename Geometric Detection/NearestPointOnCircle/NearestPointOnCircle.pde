float radius;

PVector c, nearsetPoint;

void setup() {
  size(400, 400);

  smooth();

  // 初始化圆心位置,在屏幕的中心点
  c = new PVector(width / 2, height / 2);

  // 圆的半径
  radius = 100;
}

void draw() {
  background(204);

  fill(102);

  // 绘制圆
  ellipse(c.x, c.y, 2*radius, 2*radius);

  if (mousePressed == true) {
    float x = mouseX;

    float y = mouseY;

    ellipse(x, y, 10, 10);

    // 把鼠标单击位置作为已知点求最近点
    nearsetPointOnCircle(x, y);

    fill(255, 38, 0);

    ellipse(nearsetPoint.x, nearsetPoint.y, 10, 10);
  }
}

void nearsetPointOnCircle(float qx, float qy) {
  PVector q = new PVector(qx, qy);

  PVector d = new PVector(c.x-q.x, c.y-q.y);

  float dMag = d.mag();

  float tp = (dMag - radius) / dMag;

  d.mult(tp);

  nearsetPoint = PVector.add(q, d);
}
