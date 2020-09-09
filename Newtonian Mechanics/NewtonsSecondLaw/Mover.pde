class Mover {
  // 位置向量
  PVector location;

  // 速度向量
  PVector velocity;

  // 加速度向量
  PVector acceleration;

  // 物体质量
  float mass;

  Mover() {
    mass = 2;

    location = new PVector(30, 30);

    velocity = new PVector(0, 0);

    acceleration = new PVector(0, 0);
  }

  // 牛顿第二定律
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);

    acceleration.add(f);
  }

  void update() {
    // 线性运动
    velocity.add(acceleration);

    location.add(velocity);

    // 注意每次都要重置加速度
    acceleration.mult(0);
  }

  void display() {
    stroke(0);

    fill(175);

    // 根据质量来设计球的大小
    ellipse(location.x, location.y, mass * 16, mass * 16);
  }

  // 检测与屏幕边缘的碰撞
  void checkEdges() {
    if (location.x > width) {
      velocity.x *= -1;

      location.x = width;
    } else if (location.x < 0) {
      velocity.x *= -1;

      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;

      location.y = height;
    }
  }
}
