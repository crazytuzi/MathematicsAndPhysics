Mover mover_a;

Mover mover_b;

float g = 1.4;

void setup() {
  size(640, 360);

  mover_a = new Mover(random(0.5, 1), random(50, width), random(50, height));

  mover_b = new Mover(random(1, 2), random(50, width), random(50, height));
}

void draw() {
  background(255);

  PVector force = mover_a.attract(mover_b);

  mover_b.applyForce(force);

  mover_b.update();

  mover_b.checkEdges();

  mover_b.display();

  force = mover_b.attract(mover_a);

  mover_a.applyForce(force);

  mover_a.update();

  mover_a.checkEdges();

  mover_a.display();
}
