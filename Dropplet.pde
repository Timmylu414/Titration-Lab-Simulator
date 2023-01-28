class Dropplet {
  
  //FIELDS
  int x;
  int y;
  float r;
  float speed;
  boolean inBeaker;
  
  //CONSTRUCTOR
  Dropplet(int xC, int yC, float r) {
    this.x = xC;
    this.y = yC;
    this.r = r;
    this.speed = 0;
    this.inBeaker = false;
  }
  
  //METHODS
  void drawDrop() {
    fill(200,200,255);
    circle(this.x, this.y, r);
  }
}
