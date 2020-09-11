ParticleSystem ps;

void setup() {
  size(640, 360);

  ps = new ParticleSystem(new PVector(width / 2, 50));
}

void draw() {
  background(255);

  // Apply wind and gravity forces to all Particles
  // 将风力和重力应用到粒子上
  PVector wind = new PVector(0.2, 0);

  ps.applyForce(wind);

  PVector gravity = new PVector(0, 0.1);

  ps.applyForce(gravity);

  ps.addParticle();

  ps.run();
}
