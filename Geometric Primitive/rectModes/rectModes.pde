void setup() {
  size(400, 400);
}

void draw() {
  // CORNER，默认模式
  rectMode(CORNER);

  fill(255);

  rect(60, 60, 280, 280);

  // CORNERS，对角模式
  rectMode(CORNERS);

  fill(#EE0000);

  rect(100, 100, 300, 300);

  // RADIUS，半径模式
  rectMode(RADIUS);

  fill(#1C86EE);

  rect(200, 200, 60, 60);

  // CENTER，中心点模式
  rectMode(CENTER);

  fill(#EEEE00);

  rect(200, 200, 40, 40);
}
