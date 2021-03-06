ParticleSystem ps;

PImage[] imgs;

void setup() {
  size(640, 360, P2D);

  imgs = new PImage[5];

  imgs[0] = loadImage("corona.png");

  imgs[1] = loadImage("emitter.png");

  imgs[2] = loadImage("particle.png");

  imgs[3] = loadImage("texture.png");

  imgs[4] = loadImage("reflection.png");

  ps = new ParticleSystem(imgs);
}

void draw() {
  // Additive blending!
  blendMode(ADD);

  background(0);

  PVector up = new PVector(0, -0.2);

  ps.applyForce(up);

  ps.run();

  for (int i = 0; i < imgs.length; ++i) {
    ps.addParticle(mouseX, mouseY);
  }
}
