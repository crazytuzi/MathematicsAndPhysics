// 位置向量
PVector location;

// 速度向量
PVector velocity;

// 小球半径
float radius = 16;

void setup() {
  size(640, 360);

  // 初始位置
  location = new PVector(100, 100);

  // 速度设定为常向量
  velocity = new PVector(2.5, 5);
}

void draw() {
  background(255);

  // 位置向量进行了更新
  location.add(velocity);

  // 当球遇到屏幕的最左侧和最右侧时,回弹
  if ((location.x > (width - radius)) || (location.x < radius)) {
    // x轴上的分量取反
    velocity.x *= -1;
  }

  // 当球遇到屏幕的最上边和最下边时,回弹
  if ((location.y > (height - radius)) || (location.y < radius )) {
    // y轴上的分量取反
    velocity.y *= -1;
  }

  stroke(0);

  fill(175);

  ellipseMode(RADIUS);

  // 弹跳的小球
  ellipse(location.x, location.y, radius, radius);
}
