class Particle {
  PVector location;

  PVector velocity;

  PVector acceleration;

  // 粒子的生命周期
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);

    velocity = new PVector(random(-1, 1), random(-1, 0));
    
    // 发射器
    location = l.copy();
    
    // 粒子的生命周期初始值设为255
    lifespan = 255.0;
  }

  void run() {
    update();

    display();
  }

  // Method to update location
  // 对粒子的状态进行更新
  void update() {
    velocity.add(acceleration);

    location.add(velocity);
    
    // 每次粒子生命周期都会减2 
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    // 巧妙地利用生命周期值,作为绘制时的Alpha设定
    stroke(0, lifespan);

    strokeWeight(2);

    fill(127, lifespan);

    // 绘制小球
    ellipse(location.x, location.y, 12, 12);
  }

  // Is the particle still useful?
  // 判断粒子是否已"死"
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
