ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(1000, 800);
  colorMode(HSB);
  addBall(random(width), random(height));
}

void draw() {
  background(51);

  for (Ball b : balls) {
    b.update();
    b.display();
    b.checkBoundaryCollision();
  }

  for (int i = 0; i < balls.size(); i++) {
    for (int j = i; j < balls.size(); j++) {
      balls.get(i).checkCollision(balls.get(j));
    }
  }
}

void addBall(float x, float y) {
  float r = random(20, 80);
  for (Ball b : balls) {
    if (dist(b.position.x, b.position.y, x, y) < r + b.radius) {
      balls.remove(b);
      return;
    }
  }
  balls.add(new Ball(x, y, r));
}

void mousePressed() {
  addBall(mouseX, mouseY);
}
