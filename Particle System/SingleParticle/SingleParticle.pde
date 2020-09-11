Particle p;

PVector force;

void setup() {
  size(640, 360);

  p = new Particle(new PVector(width / 2, 20));

  background(255);

  smooth();

  force = new PVector(random(0, 0.1), 0);
}

void draw() {
  background(255);

  p.run();

  if (p.isDead()) {
    p = new Particle(new PVector(width / 2, 20));
  }
}
