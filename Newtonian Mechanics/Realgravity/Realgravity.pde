Mover[] movers = new Mover[20];

void setup() {
  size(640, 360);

  for (int i = 0; i < movers.length; ++i) {
    movers[i] = new Mover(random(1, 4), 0, 0);
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; ++i) {
    PVector wind = new PVector(0.08, 0);

    float m = movers[i].mass;

    // 将物体的重力与质量建立正比联系,使得模拟更为精确
    PVector gravity = new PVector(0, 0.1 * m);

    movers[i].applyForce(gravity);

    movers[i].applyForce(wind);

    movers[i].update();

    movers[i].display();

    movers[i].checkEdges();
  }
}
