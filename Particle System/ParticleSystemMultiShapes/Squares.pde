class Squares extends Particle {
  // We could add variables for only Confetti here if we so
  // 继承父类的构造函数
  Squares(PVector l) {
    super(l);
  }

  // Inherits update() from parent

  // Override the display method
  // 重载display函数绘制粒子形状
  void display() {
    rectMode(CENTER);

    fill(random(255), random(255), random(255), lifespan);

    stroke(0, lifespan);

    strokeWeight(2);

    pushMatrix();

    translate(position.x, position.y);

    float theta = map(position.x, 0, width, 0, TWO_PI * 2);

    rotate(theta);

    rect(0, 0, 18, 18);

    popMatrix();
  }
}
