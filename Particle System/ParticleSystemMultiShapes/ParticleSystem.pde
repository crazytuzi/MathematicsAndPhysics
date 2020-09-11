class ParticleSystem {
  ArrayList<Particle> particles;

  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();

    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    float r = random(1);

    if (r < 0.33) { 
      particles.add(new Particle(origin));
    } else if (r < 0.67 && r>= 0.3) {
      particles.add(new Squares(origin));
    } else if (r >= 0.67) {
      particles.add(new Triangles(origin));
    }
  }

  void run() {
    for (int i = particles.size() - 1; i >= 0; --i) {
      Particle p = particles.get(i);

      p.run();

      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
