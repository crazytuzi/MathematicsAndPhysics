class Ball {
  // 小球的初始速度大小
  float vi;

  // 小球在运动中的位置(x坐标)
  float x;

  // 小球在运动中的位置(y坐标)
  float y;

  // 小球的初始发射角度
  float theta;

  // 小球运动的时间总和
  float time;

  // 初始化
  Ball(float _vi, float _degree) {
    vi = _vi;

    theta = radians(_degree);
  }

  // 每次更新的时候需要输入从初始到现在的时间总长
  void update(float t) {
    // 检测是否与屏幕边界发生碰撞
    if (x >= 0 && x <= width && y >=0 && y <= height) {
      // 水平方向上小球的位置变化
      x = vi * cos(theta) * t;

      // 垂直方向上小球的位置变化
      y = vi * sin(theta) * t + 0.5 * (-9.8) * t * t;

      // 绘制小球
      ellipse(x, height - y, 13, 13);

      time = t;
    } else {
      stop = true;
    }
  }

  float getVx() {
    // 水平方向上小球的速度变化
    return vi * cos(theta);
  }

  float getVy() {
    // 垂直方向上小球的速度变化
    return 9.8 * time - vi * sin(theta);
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getVi() {
    return vi;
  }

  float getTheta() {
    return theta;
  }
}
