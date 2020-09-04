// 20 little internal cubes
Sphere[] spheres = new Sphere[20];

// Size of outer cube
float bounds = 300;

void setup() {
  size(640, 480, P3D);

  for (int i = 0; i < spheres.length; i++) {
    // Cubies are randomly sized
    float radius = random(5, 15);

    spheres[i] = new Sphere(radius);
  }
}

void draw() {
  background(50);

  lights();

  // Center in display window
  translate(width / 2, height / 2, -130);

  // Rotate everything, including external large cube
  rotateX(frameCount * 0.001);

  rotateY(frameCount * 0.002);

  rotateZ(frameCount * 0.001);

  stroke(255);

  // Outer transparent cube, just using box() method
  noFill();

  box(bounds);

  // Move and rotate cubies
  for (Sphere s : spheres) {
    s.update();

    s.display();
  }
}
