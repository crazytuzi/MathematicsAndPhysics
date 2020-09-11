class Particle {
  PVector location;

  PVector velocity;

  PVector acceleration;

  float lifespan;

  float mass = 1;

  Particle(PVector l) {
    acceleration = new PVector(0, 0);

    velocity = new PVector(random(-1, 1), random(-2, 0));

    location = l.copy();

    lifespan = 255.0;
  }

  void run() {
    update();

    display();
  }

  // 粒子因所受力改变加速度
  void applyForce(PVector force) {
    PVector f = force.copy();

    f.div(mass);

    acceleration.add(f);
  }

  // Method to update location
  // 更新位置、速度并重设加速度
  void update() {
    velocity.add(acceleration);

    location.add(velocity);

    acceleration.mult(0);

    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0, lifespan);

    strokeWeight(2);

    fill(127, lifespan);

    ellipse(location.x, location.y, 12, 12);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
