
    // Dane Kadlec Space Game
Ship myShip;
ArrayList<Laser> lasers;
ArrayList<Rock> rocks;
ArrayList<PowerUp> powerups;

int score = 0;
int health = 100;

void setup() {
  size(600, 600);
  myShip = new Ship(width / 2, height - 80);
  lasers = new ArrayList<Laser>();
  rocks = new ArrayList<Rock>();
  powerups = new ArrayList<PowerUp>();
}

void draw() {
  background(24, 30, 60); 


  if (random(1) < 0.02) {
    rocks.add(new Rock(int(random(20, width-20)), -20));
  }
  if (random(1) < 0.009) {
    powerups.add(new PowerUp(int(random(20, width-20)), -20));
  }


  myShip.update();
  myShip.display();


  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser l = lasers.get(i);
    l.update();
    l.display();
    if (l.isOffScreen()) {
      lasers.remove(i);
    }
  }

 
  for (int i = rocks.size() - 1; i >= 0; i--) {
    Rock r = rocks.get(i);
    r.update();
    r.display();


    if (r.isHit(myShip)) {
      health -= 20;
      rocks.remove(i);
      continue;
    }


    for (int j = lasers.size() - 1; j >= 0; j--) {
      Laser l = lasers.get(j);
      if (dist(r.x, r.y, l.x, l.y) < (r.w/2 + 5)) {
        score += 10;
        rocks.remove(i);
        lasers.remove(j);
        break; 
      }
    }

   
    if (i < rocks.size() && r.isOffScreen()) {
      rocks.remove(i);
    }
  }


  for (int i = powerups.size() - 1; i >= 0; i--) {
    PowerUp p = powerups.get(i);
    p.update();
    p.display();

    if (p.isHit(myShip)) {
      health = min(100, health + 30);
      powerups.remove(i);
    } else if (p.isOffScreen()) {
      powerups.remove(i);
    }
  }


  fill(214, 224, 194); 
  textSize(18);
  text("Score: " + score, 20, 30);
  text("Health: " + health + "%", 20, 55);

  if (health <= 0) {
    textAlign(CENTER);
    textSize(32);
    text("GAME OVER", width/2, height/2);
    noLoop(); 
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A' || keyCode == LEFT)  myShip.isMovingLeft = true;
  if (key == 'd' || key == 'D' || keyCode == RIGHT) myShip.isMovingRight = true;
  if (key == 'w' || key == 'W' || keyCode == UP)    myShip.isMovingUp = true;
  if (key == 's' || key == 'S' || keyCode == DOWN)  myShip.isMovingDown = true;
  
  if (key == ' ') {
    lasers.add(new Laser(myShip.x, myShip.y - 20));
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A' || keyCode == LEFT)  myShip.isMovingLeft = false;
  if (key == 'd' || key == 'D' || keyCode == RIGHT) myShip.isMovingRight = false;
  if (key == 'w' || key == 'W' || keyCode == UP)    myShip.isMovingUp = false;
  if (key == 's' || key == 'S' || keyCode == DOWN)  myShip.isMovingDown = false;
}
