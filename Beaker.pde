class Beaker {

  //FIELDs
  int x;
  int y;
  int w;
  int h;
  int numDrops;
  int darkness;
  int max;
  boolean mixing;
  boolean mix;
  Analyte analyte;
  //Add float values for concentration of NaOH and HCl, using stoich equation


  //Constructor
  Beaker (Analyte a, int xC, int yC, int width, int height) {
    this.analyte = a;
    this.x = xC;
    this.y = yC;
    this.w = width;
    this.h = height;
    this.numDrops = 0;
    this.darkness = 0;
    this.mixing = false;
    this.max = 20;
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
    } else if ((this.mix == true)&&(numDrops>max)) {
      fill(this.analyte.finalC, pow(darkness, 2));
      rect(this.x+10, this.y+50, this.w-20, this.h-60, 0, 0, 20, 20);
    } else if ((this.mix == true)&&(numDrops<max)) {
      int mixFrame = frame - mixStart;
      fill(this.analyte.finalC, max(pow(darkness, 2)-((mixFrame-30)*10), pow(darkness-6, 2)));
      println(pow(darkness, 2)-((mixFrame-30)*10));
      rect(this.x+10, this.y+50, this.w-20, this.h-60, 0, 0, 20, 20);
    }
    //move stuff into mixBeaker() and disable button
  }

  void mixBeaker() {
    if ((this.mixing == true)&&(numDrops<max)) {
      pressed = false;
      if (frame - mixStart >60) {  //mixing has finished
        println(darkness);
        darkness = max(darkness-6, 0);
        this.mixing = false;
        this.mix = false;
        failMix = false;

        //pressed = true;
      } else if (frame - mixStart > 30) {
        this.mix = true;
      }
    } else if ((this.mixing == true)&&(numDrops>max)) {
      pressed = false;
      if (frame - mixStart >60) {
        this.mixing = false;
        this.mix = false;
        pressed = true;
      } else if (frame - mixStart > 30) {
        this.mix = true;
      }
    }
  }
}
