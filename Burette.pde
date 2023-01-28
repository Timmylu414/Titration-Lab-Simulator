class Burette {

  //FIELDS
  int x;
  int y;
  ArrayList<Dropplet> drops;
  float amount;
  float initialV;
  float currentV;
  float finalV;
  Titrant titrant;
  Beaker beaker;
  
  //amount left translate to V  

  //CONSTRUCTOR
  Burette(Titrant t, Beaker b, float v, int xC, int yC) {
    this.titrant = t;
    this.beaker = b;
    this.x = xC;
    this.y = yC;
    this.drops = new ArrayList<Dropplet>();
    
    this.initialV = v;
    this.currentV = v;
    this.amount = v + 40;
  }

  //METHODS
  void drawBurette() {
    rectMode(CENTER);
    fill(255);
    rect(this.x, this.y, 50, 155, 20);
    rect(this.x, this.y+80, 20, 90);
    rectMode(CORNER);
  }

  void fillBurette() {
    fill(200, 200, 255);
    rect(this.x-18, this.y + 10+(100-this.amount), 36, 60 - (100-this.amount), 0, 0, 30, 30);
    rect(this.x-5, this.y+70, 10, 55);
  }

  void dropTitrant() {
    if (this.amount > 40) {
      //println("FRAME:", frame);
      //println("Frequency:", frequency);
      //make it so if frequency is 0, then don't drip
      if (frame%(21-frequency) == 0) {
        Dropplet drop = new Dropplet(this.x, this.y+125, dropSize);
        //Add drop to list of drops 
        drops.add(drop);
        this.amount -= 1;
        this.currentV = this.amount - 40;
        
        //println(this.amount);
      }
    } else {
      fill(255);
      rect(this.x-5, this.y+65, 10, 60);
    }
  }

  void updateDrops() {
    for (int i = 0; i<drops.size(); i++) {
      Dropplet d = drops.get(i);
      d.y += d.speed;
      d.speed = d.speed + 9.81*(0.1);  //increasing the speed every frame to accelerate by gravity
     
      if ((d.y>bea.y+50)&&(this.beaker.x < d.x)&&(d.x < this.beaker.x+this.beaker.w)) {  //Checks if drop entered the beaker
        d.inBeaker = true;
        this.beaker.numDrops +=1;
        this.beaker.darkness = min(this.beaker.darkness+1, 16);
        println(beaker.numDrops);
        drops.remove(i);
      } else if ((d.y<height)&&(d.y>0)&&(d.inBeaker == false)) {
        d.drawDrop();
      }
    }
  }
}
