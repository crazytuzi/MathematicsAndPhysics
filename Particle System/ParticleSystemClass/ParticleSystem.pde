class ParticleSystem {
  // 粒子群
  ArrayList<Particle> particles;
  
  // 发射位置
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.copy();

    particles = new ArrayList<Particle>();
  }

  // 添加新粒子并设置其发射位置
  void addParticle() {
    particles.add(new Particle(origin));
  }

  // 粒子一旦生命周期结束,则从粒子系统中删去
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
