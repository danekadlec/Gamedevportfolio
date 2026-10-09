class Ship {
  float x, y;
  float speed = 6;
  float w = 30, h = 40;
  int turretCount = 1;
  boolean isMovingLeft, isMovingRight, isMovingUp, isMovingDown;

  Ship(float x, float y) {
    this.x = x;
    this.y = y;
    turretCount = 1;
  }

  void update() {
    if (isMovingLeft && x > w/2) x -= speed;
    if (isMovingRight && x < width - w/2) x += speed;
    if (isMovingUp && y > h/2) y -= speed;
    if (isMovingDown && y < height - h/2) y += speed;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    
   
    fill(100, 100, 100);
    stroke(214, 224, 194);
    strokeWeight(2);
    

    triangle(0, -28, -13, 13, 13, 13); 

    
    popMatrix();
  }
}
