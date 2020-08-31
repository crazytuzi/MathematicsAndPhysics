PVector v1;

void setup() {
  size(300, 300);

  noLoop();

  v1 = new PVector(100, 100, 0);
}

void draw() {
  // 以屏幕中心为起点,绘制向量v,黑色线段
  strokeWeight(3);

  line(width/2, height/2, width/2+v1.x, height/2+v1.y);

  // 将向量v1单位化后,反向绘制,橘色线段
  v1.normalize();

  strokeWeight(8);

  stroke(204, 102, 0);

  line(width / 2, height/2, width/2-v1.x, height/2-v1.y);
}
