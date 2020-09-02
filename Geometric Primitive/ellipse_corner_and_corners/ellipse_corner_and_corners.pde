void setup() {
  size(200, 200);
}

void draw() {
  // 绘制模式为 CORNER
  ellipseMode(CORNER);

  // 大圆的填充色为白色
  fill(255);

  // 利用CORNER模式绘制的大圆
  ellipse(50, 50, 100, 100);

  // 绘制模式为CORNERS
  ellipseMode(CORNERS);

  // 小圆的填充色为深灰色
  fill(100);

  // 利用CORNERS模式绘制的小圆
  ellipse(50, 50, 100, 100);
}
