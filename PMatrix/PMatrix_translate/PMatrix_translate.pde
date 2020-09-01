float x, y;

float dim = 80.0;

void setup() {
  size(640, 360);

  noStroke();
}

void draw() {
  background(102);

  // 每帧都把当前参照坐标系向x轴正方向平移0.8
  x = x + 0.8;

  if (x > width + dim)
  {
    // 当前参照坐标系移动到屏幕最右端时,需要对坐标系进行重置,使其定位于x = -dmin 处
    x = - dim;
  }

  translate(x, height/2-dim/2);

  fill(255);

  rect(-dim/2, -dim/2, dim, dim);
}
