class PowerUp {
  float x, y;
  float speed = 2.5;
  float size = 20;

  PowerUp(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y += speed;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    
    fill(160, 160, 20);
    stroke(214, 224, 194);
    strokeWeight(2);
    
 
    rotate(QUARTER_PI);
    rect(-size/2, -size/2, size, size);
    
    popMatrix();
  }

  boolean isOffScreen() {
    return (y > height + 50);
  }

  boolean isHit(Ship s) {
    float d = dist(x, y, s.x, s.y);
    return (d < (size/2 + s.w/2));
  }
}
