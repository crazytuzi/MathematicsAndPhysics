void setup() {
  size(200, 200);
}

void draw() {
  // 绘制模式为RADIUS
  ellipseMode(RADIUS);

  // 大圆的填充色为白色
  fill(255);

  // 利用RADIUS模式绘制的大圆
  ellipse(100, 100, 60, 60);

  //绘制模式为CENTER
  ellipseMode(CENTER);

  //小圆的填充色为深灰色
  fill(100);

  //利用CENTER模式绘制的小圆
  ellipse(100, 100, 60, 60);
}
