// Collisions -- Elastic, Different Mass, Two objects only
// A Thing class for idealized collisions

Mover a;

Mover b;

boolean showVectors = true;

void setup() {
  size(800, 450);

  float ra = 50;

  float rb = 80;

  a = new Mover(new PVector(random(3), random(-3, 3)), new PVector(100, 100), ra);

  b = new Mover(new PVector(-2, 2), new PVector(450, 250), rb);
}

void draw() {
  background(255);

  a.go();

  b.go();

  // Note this function will ONLY WORK with two objects
  // Needs to be revised in the case of an array of objects  
  a.collideDiffMass(b);
}
