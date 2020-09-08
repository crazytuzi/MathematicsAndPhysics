class Ball {
  // 小球的初始速度向量
  PVector v0;

  // 小球运动的时间总和
  float time;

  // 小球运动中的位置向量
  PVector position;

  // 初始化
  Ball(PVector _v0) {
    v0 = _v0.copy();

    position = new PVector();
  }

  // 每次更新的时候需要输入从初始到现在的时间总长
  void update(float t) {
    // 检测是否与屏幕边界发生碰撞
    if (position.x >= 0 && position.x <= width && position.y >=0 && position.y <= height) {
      PVector v = v0.copy();

      // 计算v0 * t
      v.mult(t);

      PVector g = new PVector(0, 9.8);

      // 计算0.5 * g * t * t
      g.mult(0.5 * t * t);

      // 小球的初始发射位置
      position.set(0, height);

      position.add(PVector.add(v, g));

      ellipse(position.x, position.y, 13, 13);

      time = t;
    } else {
      stop = true;
    }
  }

  // 计算小球运动中的速度
  PVector getVel() {
    PVector g = new PVector(0, 9.8);

    g.mult(time);

    g.add(v0);

    return g;
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
