Ball b;

void setup(){
  fullScreen();
  b = new Ball(width/2, height/2);

}//setup (runs once at the start)

void draw(){
  background(0);
  b.move();
  b.display();
  
}//draw
