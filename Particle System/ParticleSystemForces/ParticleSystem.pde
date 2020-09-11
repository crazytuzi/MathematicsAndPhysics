class ParticleSystem {
  ArrayList<Particle> particles;

  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.copy();

    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    // 粒子系统中所有粒子都会受到力
    for (Particle p : particles) {
      p.applyForce(f);
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
