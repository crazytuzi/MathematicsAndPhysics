float a = 0.0;

float s = 0.0;

void setup() {
  size(400, 300);

  noStroke();

  rectMode(CENTER);

  frameRate(30);
}

void draw() {
  background(102);

  // 设置变换因子
  a = a + 0.04;

  s  = cos(a) * 2;

  // 当前参照坐标系平移到屏幕中心
  translate(width/2, height/2);

  // 将平移后的参照坐标系再进行均匀缩放
  scale(s);

  fill(255);

  rect(0, 0, 80, 80);
}
