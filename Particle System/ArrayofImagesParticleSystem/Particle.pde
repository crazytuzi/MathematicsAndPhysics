class Particle {
  PVector loc;

  PVector vel;

  PVector acc;

  float lifespan;

  PImage img;

  // Another constructor (the one we are using here)
  Particle(float x, float y, PImage imgIn) {
    // Boring example with constant acceleration
    acc = new PVector(0, 0);

    vel = PVector.random2D();

    loc = new PVector(x, y);

    lifespan = 255;

    img = imgIn;
  }

  void run() {
    update();

    render();
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  // Method to update location
  void update() {
    vel.add(acc);

    loc.add(vel);

    acc.mult(0);

    lifespan -= 2.0;
  }

  // Method to render
  void render() {
    imageMode(CENTER);

    tint(lifespan);

    image(img, loc.x, loc.y, 32, 32);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
