// 旋转角度
float a = 0.0;

// 立方体之间的角度差
float offset = PI / 24.0;

// 立方体个数
int num = 12;

void setup() {
  size(640, 360, P3D);

  noStroke();
}

void draw() {
  lights();

  background(0, 0, 26);

  // 将当前物体坐标系的原点从(0, 0)移到屏幕中心
  translate(width/2, height/2);

  for (int i = 0; i < num; i++)
  {
    float gray = map(i, 0, num-1, 0, 255);

    pushMatrix();

    fill(gray);

    // 绕着y轴旋转
    rotateY(a + offset * i);

    // 绕着x轴旋转

    rotateX(a / 2 + offset * i);

    box(200);

    popMatrix();
  }

  a += 0.01;
}
