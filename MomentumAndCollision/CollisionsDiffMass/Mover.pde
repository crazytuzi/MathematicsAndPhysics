class Mover {
  PVector loc;

  PVector vel;

  float epsilon = 1.0;

  float r = 20;

  boolean colliding = false;

  Mover(PVector v, PVector l, float mass) {
    vel = v.copy();

    loc = l.copy();

    r = mass;
  }

  // Main method to operate object
  void go() {
    update();

    borders();

    display();
  }

  // Method to update location
  void update() {
    loc.add(vel);
  }

  // Check for bouncing off borders
  void borders() {
    if (loc.y > height - r) {
      vel.y *= -epsilon;

      loc.y = height - r;
    } else if (loc.y < r) {
      vel.y *= -epsilon;

      loc.y = r;
    }

    if (loc.x > width - r) {
      vel.x *= -epsilon;

      loc.x = width - r;
    } else if (loc.x < r) {
      vel.x *= -epsilon;

      loc.x = r;
    }
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);

    stroke(0);

    fill(175, 200);

    ellipse(loc.x, loc.y, r * 2, r * 2);

    if (showVectors) {
      drawVector(vel, loc, 10);
    }
  }

  void collideDiffMass(Mover other) {
    float d = PVector.dist(loc, other.loc);

    float sumR = r + other.r;

    // 首先判断是否已经发生了碰撞
    if (!colliding && d < sumR) {
      // 确定发生碰撞
      colliding = true;

      // 两球球心连线的向量并进行单位化
      PVector c = PVector.sub(other.loc, loc);

      c.normalize();

      // 将当前小球的速度转为相对速度
      PVector V1i = PVector.sub(vel, other.vel);

      // 求解出向量
      PVector V1iy = c.copy();

      V1iy.mult(V1i.dot(c));

      PVector V1f = PVector.sub(V1i, PVector.mult(V1iy, (1 + epsilon) * other.r / (r + other.r)));

      PVector V2f = PVector.mult(V1iy, (1 + epsilon) * r / (r + other.r));

      // 将两个球碰撞的速度从绝对速度重新转换为相对速度
      vel = PVector.add(V1f, other.vel);

      other.vel = PVector.add(V2f, other.vel);
    } else if (d > sumR) {
      colliding = false;
    }
  }
}
