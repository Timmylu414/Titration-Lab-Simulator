class Beaker {

  //FIELDs
  Analyte analyte;
  Titrant titrant;
  int x;
  int y;
  int w;
  int h;
  int numDrops;
  float dropAmount;
  int darkness;
  float max;
  boolean mixPress;
  boolean mix;
  
  //Add float values for concentration of NaOH and HCl, using stoich equation


  //Constructor
  Beaker (Analyte a, Titrant t, int xC, int yC, int width, int height) {
    this.analyte = a;
    this.titrant = t;
    this.x = xC;
    this.y = yC;
    this.w = width;
    this.h = height;
    this.numDrops = 0;
    this.dropAmount = 0;
    this.darkness = 0;
    this.max = t.volume;
    this.mixPress = false;
    this.mix = false;
  }

  //METHODS

  void drawBeaker() {
    fill(255);
    rect(this.x, this.y, this.w, this.h, 0, 0, 20, 20);
  }

  void fillBeaker() {
    fill(this.analyte.initialC, 140);
    rect(this.x+10, this.y+50, this.w-20, this.h-60, 0, 0, 20, 20);

    this.mixBeaker();

    if (this.mix == false) {
      fill(this.analyte.finalC, pow(darkness, 2));
      rect(this.x+10, this.y+50, this.w-20, this.h-60, 0, 0, 20, 20);
    } else if ((this.mix == true)&&(dropAmount>max)) {
      fill(this.analyte.finalC, pow(darkness, 2));
      rect(this.x+10, this.y+50, this.w-20, this.h-60, 0, 0, 20, 20);
    } else if ((this.mix == true)&&(dropAmount<max)) {
      int mixFrame = frame - mixStart;
      fill(this.analyte.finalC, max(pow(darkness, 2)-((mixFrame-20)*5), pow(darkness-6, 2)));
      println(pow(darkness, 2)-((mixFrame-20)*5));
      rect(this.x+10, this.y+50, this.w-20, this.h-60, 0, 0, 20, 20);
    }
    //move stuff into mixBeaker() and disable button
  }

  void mixBeaker() {
    if ((this.mixPress == true)&&(dropAmount<max)) {
      pressed = false;
      if (frame - mixStart >40) {  //mixing has finished
        println(darkness);
        darkness = max(darkness-3, 0);
        this.mixPress = false;
        this.mix = false;
        failMix = false;

        //pressed = true;
      } else if (frame - mixStart > 20) {
        this.mix = true;
      }
    } else if ((this.mixPress == true)&&(dropAmount>max)) {
      pressed = false;
      if (frame - mixStart >40) {
        this.mixPress = false;
        this.mix = false;
        pressed = true;
      } else if (frame - mixStart > 20) {
        this.mix = true;
      }
    }
  }
}
