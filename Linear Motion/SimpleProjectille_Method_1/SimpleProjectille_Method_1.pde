Ball cannonball = new Ball(50 * sqrt(2), 45);

float time = 0;

boolean stop;

int interval = 10;

void setup() {
  size(1400, 550);

  background(0);

  fill(255, 90);

  stroke(255);

  smooth();

  frameRate(60);

  stop = false;
}

void draw() {
  background(0);

  cannonball.update(time);

  if (stop != true) {
    time += 1 / (float)interval;
  }

  displayData();
}

void displayData() {
  int pos1 = 20;

  int pos2 = 200;

  int pos3 = 420;

  int pos4 = 640;

  int line1 = 20;

  int line2 = 43;

  int line3 = 66;

  fill(255, 128, 0);

  textSize(20);

  text("R(t) - Position", pos1, line1);

  text("x: " + round(cannonball.getX()) + " m", pos1, line2);

  text("y: " + round(cannonball.getY()) + " m", pos1, line3);

  text("Projectile info", pos2, line1);

  text("Vi = " + cannonball.getVi() + " m/s", pos2, line2);

  text("Degrees = " + degrees(cannonball.getTheta()) + " °", pos2, line3);

  text("Velocity info", pos3, line1);

  text("Vx = " + round(cannonball.getVx()) + " m/s", pos3, line2);

  text("Vy = " + round(cannonball.getVy()) + " m/s", pos3, line3);

  text("Other data", pos4, line1);

  text("Time = " + time + " s", pos4, line2);

  fill(255, 90);
}

void mousePressed() {
  stop = false;

  time = 0;

  cannonball = new Ball(50 * sqrt(2), 45);
}
