class Rock {
  float x, y;
  float speed = 3;
  float w = 40, h = 40;

  Rock(int x, int u) {
    this.x = x;
    this.y = u;
  }

  void update() {
    y += speed;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    
    fill(80, 8, 32);
    stroke(214, 224, 194);
    strokeWeight(2);
    
    ellipse(0, 0, w, h);
    
    popMatrix();
  }

  boolean isOffScreen() {
    return (y > height + 50);
  }

  boolean isHit(Ship s) {
    float d = dist(x, y, s.x, s.y);
    return (d < (w/2 + s.w/2));
  }
}
