class Laser {
  float x, y;
  float speed = 7;

  Laser(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y -= speed;
  }

  void display() {
    fill(224, 194, 162);
    noStroke();
    rect(x - 2, y, 4, 15);
  }

  boolean isOffScreen() {
    return (y < -20);
  }
}
