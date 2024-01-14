class Ball {
  PVector pos, vel;
  float radius;
  ArrayList<Ball> otherBalls;
  int numCollisions;
  
  public Ball(float initX, float initY) {
    pos = new PVector(initX,initY);
    radius = 50;
    vel = new PVector(2,5);
    otherBalls = new ArrayList <> ();
    
    numCollisions = 0;
  }//Ball
  
  public void display() {
    fill(numCollisions, 110, 200);
    circle(pos.x, pos.y, radius);
  }
  
  public void move() {
    pos.add(vel);
    
    //checks for boundary collisions
    
    
    if (pos.y + radius >= height) { //when it hits the ground
      //hit ground
      vel.y *= -1; //losing 10% energy on every bounce
    } else if (pos.y <= radius) { //when it hits the top
      vel.y *= -1;
    }//if
      
    if (pos.x + radius >= width) {
      //hits sides 
      vel.x *= -1;
    } else if (pos.x <= radius) {
      vel.x *= -1;
    }//if
    
    //check for ball collision
    for (int i = 0; i < otherBalls.size(); i++) {
      PVector otherPos = otherBalls.get(i).pos;
      float distance = dist(pos.x, pos.y, otherPos.x, otherPos.y);
      
      if (distance !=0 && distance < radius) {
        numCollisions += 10;
        
        // Calculate the angle of collision
        float angle = atan2(pos.y - otherPos.y, pos.x - otherPos.x);

        // Calculate new velocities based on the collision angle
        float newVelX = cos(angle) * vel.mag();
        float newVelY = sin(angle) * vel.mag();

        // Update velocities
        vel.x = newVelX;
        vel.y = newVelY;
        
      }//if
    }//for
  }//move
  
  public void setBalls(ArrayList<Ball> balls) {
    this.otherBalls = balls;
  }//setBalls
  
  
} //Ball
