Mover[] movers = new Mover[5];

void setup() {
  size(383, 200);

  randomSeed(1);

  for (int i = 0; i < movers.length; ++i) {
    movers[i] = new Mover(random(1, 4), random(width), 0);
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; ++i) {
    PVector wind = new PVector(0.01, 0);

    float m = movers[i].mass;

    // 将物体的重力与质量建立正比联系,使得模拟更为精确
    PVector gravity = new PVector(0, 0.1 * m);

    float c = 0.05;

    PVector friction = movers[i].velocity.copy();

    friction.mult(-1);

    friction.normalize();

    friction.mult(c);

    movers[i].applyForce(gravity);

    movers[i].applyForce(wind);

    movers[i].applyForce(friction);

    movers[i].update();

    movers[i].display();

    movers[i].checkEdges();
  }
}
