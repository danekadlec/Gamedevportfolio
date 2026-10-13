class Rock {
  float x, y;
  float vx = 0;
  float vy = 3;
  float w = 40, h = 40;
  float seed;

  Rock(int x, int u) {
    this.x = x;
    this.y = u;
    this.seed = random(1000);
  }

  Rock(int x, int u, float angle) {
    this.x = x;
    this.y = u;
    this.w = 20;
    this.h = 20;
    this.seed = random(1000);
    float projectileSpeed = 4;
    this.vx = cos(angle) * projectileSpeed;
    this.vy = sin(angle) * projectileSpeed;
  }

  void update() {
    x += vx;
    y += vy;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    
    fill(80, 8, 32);
    stroke(214, 224, 194);
    strokeWeight(2);
    
    beginShape();
    int totalPoints = 12;
    for (int i = 0; i < totalPoints; i++) {
      float angle = map(i, 0, totalPoints, 0, TWO_PI);
      float radiusOffset = map(noise(cos(angle) + seed, sin(angle) + seed), 0, 1, -5, 5);
      float currentRadius = (w / 2) + radiusOffset;
      float pointX = cos(angle) * currentRadius;
      float pointY = sin(angle) * currentRadius;
      vertex(pointX, pointY);
    }
    endShape(CLOSE);
    
    popMatrix();
  }

  boolean isOffScreen() {
    return (y > height + 50 || x < -50 || x > width + 50);
  }

  boolean isHit(Ship s) {
    float d = dist(x, y, s.x, s.y);
    return (d < (w/2 + s.w/2));
  }
}

 + s.w/2));
  }
}
