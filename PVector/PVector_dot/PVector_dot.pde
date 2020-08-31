PVector v1, v2;

void setup() {
  size(300, 300);

  noLoop();

  v1 = new PVector(100, 200, 0);

  v2 = new PVector(100, 80, 0);
}

void draw() {
  strokeWeight(10);
  // 绘制向量v1和向量v2,黑色线段
  line(0, 0, v1.x, v1.y);

  line(0, 0, v2.x, v2.y);

  // 将向量v2单位化后,v1投影在其中
  v2.normalize();

  // 利用点乘计算出投影长度
  float d = v1.dot(v2);

  // 将单位向量进行伸长,扩展为v1的平行分量,将其绘制,橘色线段
  v2.mult(d);

  strokeWeight(5);

  stroke(204, 102, 0);

  line(0, 0, v2.x, v2.y);
}
