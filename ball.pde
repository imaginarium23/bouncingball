class Ball { //object
  PVector pos, vel; //first attribute stores position, second attribute adds force
  float radius;
  
  public Ball(float initx, float initY){
    pos = new PVector(initX,initY);
    radius = 50;
    
  }//Ball
  
  
  public void display() {
     circle(pos.x, pos.y, radius);
  }//display
  
  public void move() {
    pos.add(vel);
  }//move

} //Ball
