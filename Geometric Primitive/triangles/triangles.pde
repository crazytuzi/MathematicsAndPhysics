void setup() {
  size(200, 250);
}

void draw() {
  // 直接调用triangle绘制三角形，最上白色
  // Filled triangle 
  triangle(120, 20, 50, 120, 150, 130);

  // 第二种绘制三角形的方法，中间线框
  // Outlined triangle edge
  line(120, 60, 60, 160);

  // Outlined triangle edge
  line(60, 160, 150, 170);

  // Outlined triangle edge
  line(150, 170, 120, 60);

  // 第三种绘制三角形的方法，下方灰色
  fill(126);

  beginShape(TRIANGLES);

  vertex(120, 100);

  vertex(70, 210);

  vertex(150, 210);

  endShape();
}
