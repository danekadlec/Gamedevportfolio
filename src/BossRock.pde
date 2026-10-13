class BossRock {
  float x, y;
  float speed = 1.5;
  float w = 80, h = 80;
  float seed;
  int maxHp = 5;
  int hp = 5;
  int lastShotTime = 0;

  BossRock(int x, int u) {
    this.x = x;
    this.y = u;
    this.seed = random(1000);
    this.lastShotTime = millis();
  }

  void update() {
    y += speed;
    
    if (millis() - lastShotTime > 2000) {
      float angle = atan2(myShip.y - y, myShip.x - x);
      rocks.add(new Rock((int)x, (int)y, angle));
      lastShotTime = millis();
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    
    fill(40, 80, 120);
    stroke(150, 200, 255);
    strokeWeight(3);
    
    beginShape();
    int totalPoints = 16;
    for (int i = 0; i < totalPoints; i++) {
      float angle = map(i, 0, totalPoints, 0, TWO_PI);
      float radiusOffset = map(noise(cos(angle) + seed, sin(angle) + seed), 0, 1, -20, 20);
      float currentRadius = (w / 2) + radiusOffset;
      float pointX = cos(angle) * currentRadius;
      float pointY = sin(angle) * currentRadius;
      vertex(pointX, pointY);
    }
    endShape(CLOSE);
    
    noStroke();
    fill(200, 50, 50);
    rect(-30, -w/2 - 15, 60, 6);
    fill(50, 200, 50);
    float healthWidth = map(hp, 0, maxHp, 0, 60);
    rect(-30, -w/2 - 15, healthWidth, 6);
    
    popMatrix();
  }

  boolean isOffScreen() {
    return (y > height + 100);
  }

  boolean isHit(Ship s) {
    float d = dist(x, y, s.x, s.y);
    return (d < (w/2 + s.w/2));
  }
}
