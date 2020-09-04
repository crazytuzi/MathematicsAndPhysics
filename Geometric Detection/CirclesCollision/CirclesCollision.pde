Circle a, b;

boolean showVectors = true;

void setup() {
  size(200, 200);

  a = new Circle(new PVector(random(3), random(-3, 3)), new PVector(10, 10));

  b = new Circle(new PVector(-2, 2), new PVector(150, 150));
}

void draw() {
  background(255);

  a.go();

  b.go();

  // Note this function will ONLY WORK with two objects
  // Needs to be revised in the case of an array of objects
  a.collideEqualMass(b);
}
