class Ball {
  // 小球的初始速度向量
  PVector v0;

  // 小球运动中的速度向量
  PVector v;

  // 小球运动中的位置向量
  PVector position;

  // 初始化
  Ball(PVector _v0) {
    v0 = _v0.copy();

    v = _v0.copy();

    position = new PVector(0, height);
  }

  void update() {
    // 检测是否与屏幕边界发生碰撞
    if (position.x >= 0 && position.x <= width && position.y >=0 && position.y <= height) {
      // 用工程化的思想,对重力加速度取经验值
      PVector g = new PVector(0, 0.035);

      // 计算小球运动中当前时刻的速度向量
      v.add(g);

      // 计算小球运动中当前时刻的位置向量
      position.add(v);

      ellipse(position.x, position.y, 13, 13);
    } else {
      stop = true;
    }
  }

  // 返回小球运动中当前时刻的速度向量
  PVector getVel() {
    return v;
  }

  PVector getPosition() {
    return position;
  }

  float getSpeed() {
    return v0.mag();
  }

  float getTheta() {
    return v0.heading();
  }
}
