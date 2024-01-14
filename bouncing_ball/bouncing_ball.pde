ArrayList<Ball> balls;
int numBalls = 40;

void setup() {
  size(1300, 1000);
  colorMode(HSB);
  balls = new ArrayList <> ();
  
  for (int i = 0; i <numBalls; i++) {
    balls.add(new Ball(random(width), random(height)));
  }//for
  
  for (int i = 0; i < numBalls; i ++) {
    balls.get(i).setBalls(balls);
  }//for
} //setup

void draw() {
  background(30);
  for (Ball b: balls) {
    b.move();
    b.display();
  }//for
} //draw

void mousePressed(){
  PVector mousePos = new PVector(mouseX, mouseY);
  balls.get(0).vel = mousePos.sub(balls.get(0).pos); 
  balls.get(0).vel.setMag(4);
}//mousePressed
