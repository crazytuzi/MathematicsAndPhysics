PVector p1, p2, n;

float d = 0;

void setup() {
  size(200, 200);

  p1 = new PVector(40, 50);

  p2 = new PVector(160, 150);
}

void draw() {
  // 绘制过这两点的线段
  line(p1.x, p1.y, p2.x, p2.y);

  strokeWeight(10);

  stroke(#FF4040);

  // 绘制两个端点
  point(p1.x, p1.y);

  point(p2.x, p2.y);

  // 通过已知两点求解出指向的"标准向量 + 距离"
  float m = (p2.y - p1.y) / (p2.x - p1.x);

  float tmp = sqrt(m * m + 1);

  n = new PVector(m / tmp, -1 / tmp);

  d = (m * p1.x - p1.y) / tmp;

  // 在线段中点绘制n和d
  PVector midPoint = new PVector(p1.x + p2.x, p1.y + p2.y);

  midPoint.mult(0.5);

  strokeWeight(5);

  stroke(#6495ED);

  line(midPoint.x, midPoint.y, midPoint.x + n.x * d, midPoint.y + n.y * d);
}
