PVector p1, p2, n;

float d = 0;

void setup() {
  size(300, 300);

  p1 = new PVector(40, 30);

  p2 = new PVector(250, 270);

  // 求解n和d
  PVector vec = PVector.sub(p1, p2);

  vec.normalize();

  n = new PVector(-vec.y, vec.x);

  d = n.dot(p1);
}

void draw() {
  background(#CCCCCC);

  // 绘制线段及两个端点
  stroke(#000000);

  strokeWeight(2);

  line(p1.x, p1.y, p2.x, p2.y);

  strokeWeight(10);

  stroke(#FF4040);

  point(p1.x, p1.y);

  point(p2.x, p2.y);

  // 用当前鼠标的位置点作为已知点去q(黄色标注)
  PVector q = new PVector(mouseX, mouseY);

  strokeWeight(8);

  stroke(#EEEE00);

  point(q.x, q.y);

  // q' = q + (d - qn)n
  if (mousePressed) { // 当鼠标单击时求解直线上最近点
    float tmp = d - q.dot(n);

    PVector nearsetPoint = new PVector(n.x, n.y);

    nearsetPoint.mult(tmp);

    nearsetPoint.add(q);

    stroke(#00CD00);

    point(nearsetPoint.x, nearsetPoint.y);

    stroke(#0000EE);

    strokeWeight(2);

    // 绘制两点的距离
    line(q.x, q.y, nearsetPoint.x, nearsetPoint.y);
  }
}
