class Circle {
  PVector loc;

  PVector vel;

  float bounce = 1.0;

  float r = 20;

  boolean colliding = false;

  Circle(PVector v, PVector l) {
    vel = v.copy();

    loc = l.copy();
  }

  // Main method to operate object
  void go() {
    update();

    borders();

    display();
  }

  // Method to update location
  void update() {
    loc.add(vel);
  }

  // Check for bouncing off borders
  void borders() {
    if (loc.y > height - r) {
      vel.y *= -bounce;

      loc.y = height - r;
    } else if (loc.y < r) {
      vel.y *= -bounce;

      loc.y = r;
    }

    if (loc.x > width - r) {
      vel.x *= -bounce;

      loc.x = width - r;
    } else if (loc.x < r) {
      vel.x *= -bounce;

      loc.x = r;
    }
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);

    stroke(0);

    fill(175, 200);

    ellipse(loc.x, loc.y, r * 2, r * 2);

    if (showVectors) {
      drawVector(vel, loc, 10);
    }
  }

  // 检测两圆是否相交
  // 输入参数为两个圆各自的圆心和半径
  boolean intersect(Circle other) {
    float d = PVector.dist(loc, other.loc);

    float sumR = r + other.r;

    if (d <= sumR) {
      return true;
    } else {
      return false;
    }
  }

  void collideEqualMass(Circle other) {
    // Are they colliding?
    boolean isX = intersect(other);

    if (!colliding && isX) {
      // Yes, make new velocities!
      colliding = true;

      // Direction of one object another
      PVector n = PVector.sub(other.loc, loc);

      n.normalize();

      // Difference of velocities so that we think of one object as stationary
      PVector V1i = PVector.sub(vel, other.vel);

      // Separate out components -- one in direction of normal
      PVector V1iy = componentVector(V1i, n);

      // Other component V1ix
      V1i.sub(V1iy);
      
      // These are the new velocities plus the velocity of the object we consider as stastionary
      vel = PVector.add(V1i, other.vel);

      other.vel = PVector.add(V1iy, other.vel);
    } else if (!isX) {
      colliding = false;
    }
  }
}

PVector componentVector(PVector vector, PVector directionVector) {
  // --! ARGUMENTS: vector, directionVector (2D vectors)
  // --! RETURNS: the component vector of vector in the direction directionVector
  // -- normalize directionVector
  directionVector.normalize();

  directionVector.mult(vector.dot(directionVector));

  return directionVector;
}
