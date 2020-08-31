PVector v1, v2;

float vLength;

PVector vMid;

void setup() {
  size(400, 400, P3D);

  noLoop();

  v1 = new PVector(1, 1, 1);

  v2 = new PVector(-1, 1, 1);

  vLength = 80;

  vMid = new PVector(width/2, height/2, 0);
}

void draw() {
  // 绘制向量v1和v2,黑色线段
  strokeWeight(3);

  line(vMid.x, vMid.y, vMid.z, vMid.x+vLength*v1.x, vMid.y+vLength*v1.y, vMid.z+vLength*v1.z);

  line(vMid.x, vMid.y, vMid.z, vMid.x+vLength*v2.x, vMid.y+vLength*v2.y, vMid.z+vLength*v2.z);

  // 利用叉乘求解出向量v1和v2所在平面的平面法线,将其绘制,橘色线段
  stroke(204, 102, 0);

  strokeWeight(5);

  PVector v3 = v1.cross(v2);

  v3.normalize();

  line(vMid.x, vMid.y, vMid.z, vMid.x+vLength*v3.x, vMid.y+vLength*v3.y, vMid.z+vLength*v3.z);
}
