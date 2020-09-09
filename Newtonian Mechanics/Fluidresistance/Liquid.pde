class Liquid {
  // Liquid is a rectangle
  float x, y, w, h;

  // Coefficient of drag
  float c;

  Liquid(float _x, float _y, float _w, float _h, float _c) {
    x = _x;

    y = _y;

    w = _w;

    h = _h;

    c = _c;
  }

  // Is the Mover in the Liquid?
  boolean contains(Mover m) {
    PVector l = m.location;

    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }

  // Calculate drag force
  PVector drag(Mover m) {
    // Magnitude is coefficient * speed squared
    float speed = m.velocity.mag();

    float dragMagnitude = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = m.velocity.copy();

    dragForce.mult(-1);

    dragForce.normalize();

    dragForce.mult(dragMagnitude);

    return dragForce;
  }

  void display() {
    noStroke();

    fill(50);

    rect(x, y, w, h);
  }
}
