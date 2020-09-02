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

  // 标准向量n和直线本身所在的方向相互垂直,因此这两个向量的点乘为0
  // 换言之,如果表示直线本身所在方向的单位向量记为[a b],那么标准向量n可记为[-b a]
  PVector vec = PVector.sub(p1, p2);

  vec.normalize();

  n = new PVector(-vec.y, vec.x);

  d = n.dot(p1);

  // 在线段中点绘制n和d
  PVector midPoint = new PVector(p1.x + p2.x, p1.y + p2.y);

  midPoint.mult(0.5);

  strokeWeight(5);

  stroke(#6495ED);

  line(midPoint.x, midPoint.y, midPoint.x + n.x * d, midPoint.y + n.y * d);
}
