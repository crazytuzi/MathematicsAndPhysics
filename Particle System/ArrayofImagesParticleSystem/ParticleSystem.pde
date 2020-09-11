class ParticleSystem {
  // An arraylist for all the particles
  ArrayList<Particle> particles;

  PImage[] textures;

  ParticleSystem(PImage[] imgs) {
    textures = imgs;

    // Initialize the arraylist
    particles = new ArrayList();
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

  void addParticle(float x, float y) {
    int r = int(random(textures.length));

    particles.add(new Particle(x, y, textures[r]));
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
}
