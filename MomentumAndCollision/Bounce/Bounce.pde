/**
 * Bounce. 
 * 
 * When the shape hits the edge of the window, it reverses its direction. 
 */

// Width of the shape
int rad = 40;

// Starting position of shape
PVector pos;

// Speed of the shape
PVector vel;

void setup() {
  size(640, 360);

  noStroke();

  frameRate(60);

  ellipseMode(RADIUS);

  // Set the starting position of the shape
  pos = new PVector(width / 2, height / 2);

  vel = new PVector(2.8, 2.2);
}

void draw() {
  background(102);

  // Update the position of the shape
  pos.add(vel);

  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  checkCollisionWithEdges();

  // Draw the shape
  ellipse(pos.x, pos.y, rad, rad);
}

void checkCollisionWithEdges() {
  if (pos.x > width - rad || pos.x < rad) {
    vel.x *= -1;
  }

  if (pos.y > height - rad || pos.y < rad) {
    vel.y *= -1;
  }
}
