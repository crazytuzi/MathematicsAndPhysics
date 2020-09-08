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

  void update(float interval) {
    // 检测是否与屏幕边界发生碰撞
    if (position.x >= 0 && position.x <= width && position.y >=0 && position.y <= height) {
      PVector g = new PVector(0, 9.8);

      // 保留前一个时刻的速度向量
      PVector tpV = v.copy();

      // 计算v0 * t,参数interval是两个观察点之间的时间间隔
      g.mult(interval);

      // 计算小球运动中当前时刻的速度向量
      v.add(g);

      g.set(0, 9.8);

      // 计算0.5 * g * t * t
      g.mult(0.5 * interval * interval);

      tpV.mult(interval);

      // 两个时间间隔内物体的位移
      tpV.add(g);

      // 小球当前时刻的位置,应该是前一刻的位置再加上这个时间间隔内的位置
      position.add(tpV);

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
