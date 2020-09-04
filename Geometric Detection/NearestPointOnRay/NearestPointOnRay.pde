PVector p0, d, q;

float t = 0;

void setup() {
  size(300, 300);

  // 设置已知点
  q = new PVector(150, 150);

  // 设置射线起点
  p0 = new PVector(10, 10);
}

void draw() {
  background(#CCCCCC);

  // 将屏幕光标的位置作为射线的终点
  PVector end = new PVector(mouseX, mouseY);

  stroke(#000000);

  strokeWeight(2);

  // 绘制射线
  line(p0.x, p0.y, end.x, end.y);

  strokeWeight(10);

  stroke(#FF4040);

  // 绘制射线的端点(红色)
  point(p0.x, p0.y);

  // 绘制射线的端点(红色)
  point(end.x, end.y);

  stroke(#EEEE00);

  // 绘制已知点(黄色)
  point(q.x, q.y);

  // 计算向量v和d
  d = PVector.sub(end, p0);

  float l = d.mag();

  d.normalize();

  PVector v = PVector.sub(q, p0);

  // 计算投影长度t
  t = v.dot(d);

  d.mult(t);

  // 判断投影长度是否在射线长度范围内
  if (t < 0 || t>l) {
    // 投影点在范围外,但是离起点近,最近是起点
    if (t < 0) {
      d.set(p0.x, p0.y);
    }
    // 投影点在范围外,但是离终点近,最近是终点
    else {
      d.set(end.x, end.y);
    }
  } else {
    // q' = p0 + ((q - p0)d)d,投影点在范围内,按照公式计算
    d.add(p0);
  }

  stroke(#00CD00);

  // 绘制投影点(绿色)
  point(d.x, d.y);

  stroke(#0000EE);

  strokeWeight(2);

  // 绘制投影点和已知点的连线
  line(q.x, q.y, d.x, d.y);
}
