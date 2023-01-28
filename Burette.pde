class Burette {

  //FIELDS
  int x;
  int y;
  ArrayList<Dropplet> drops;
  float amount;
  float currentV;
  Titrant titrant;
  Beaker beaker;

  //amount left translate to V  

  //CONSTRUCTOR
  Burette(Titrant t, Beaker b, float v, int xC, int yC) {
    this.titrant = t;
    this.beaker = b;
    this.currentV = v;
    this.x = xC;
    this.y = yC;
    this.drops = new ArrayList<Dropplet>();
    this.amount = v + 40;  //value used for graphics
  }

  //METHODS
  void drawBurette() {
    rectMode(CENTER);
    fill(255);
    rect(this.x, this.y, 50, 155, 20);
    rect(this.x, this.y+80, 20, 90);
    rectMode(CORNER);
  }

  void fillBurette() {  //Draws liquid inside burette, seemingly decreasing volume when dropping
    fill(200, 200, 255);
    rect(this.x-18, this.y + 10+(100-(this.currentV+40)), 36, 60 - (100-this.amount), 0, 0, 30, 30);  
    rect(this.x-5, this.y+70, 10, 55);
  }

  void dropTitrant() {
    if (pressed == true) {
      if (this.amount > 40) {
        //println("FRAME:", frame);
        //println("Frequency:", frequency);
        if (frame % (41-(frequency*4)) == 0) {  //Increase in frequency causes burette to drip faster
          Dropplet drop = new Dropplet(this.x, this.y+125, dropSize);
          //Add drop to list of drops 
          drops.add(drop);
          this.amount -= dropSize/10.0;
          this.currentV -= dropSize/10.0;
          println("bamount: ", this.amount);
          //println(this.amount);
        }
      } else {
        fill(255);
        rect(this.x-5, this.y+65, 10, 60);
      }
    }
  }

  void updateDrops() {
    //Going through every drop and accelerating it by gravity, as well as updating x positions and checking if it landed in beaker
    for (int i = 0; i<drops.size(); i++) {  
      Dropplet d = drops.get(i);
      d.y += d.speed;
      d.speed = d.speed + 9.81*(0.1);  //increasing the speed every frame to accelerate by gravity

      if ((d.y>bea.y+50)&&(this.beaker.x < d.x)&&(d.x < this.beaker.x+this.beaker.w)) {  //Checks if drop entered the beaker
        d.inBeaker = true;
        this.beaker.dropAmount = (this.beaker.dropAmount +(dropSize/10.0));
        this.beaker.darkness = min(this.beaker.darkness+(dropSize/10.0), 16);
        drops.remove(i);
      } else if ((d.y<height)&&(d.y>0)&&(d.inBeaker == false)) {  //If drop is anywhere else and still on screen, still draw
        d.drawDrop();
      }
    }
  }
}
