class Beaker {

  //FIELDS
  Analyte analyte;
  Titrant titrant;
  int x;
  int y;
  int w;
  int h;
  float dropAmount;
  float darkness;
  float max;
  boolean mixPress;
  boolean mix;

  //CONSTRUCTOR
  Beaker (Analyte a, Titrant t, int xC, int yC, int width, int height) {
    this.analyte = a;
    this.titrant = t;
    this.x = xC;
    this.y = yC;
    this.w = width;
    this.h = height;
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
    rect(this.x+10, this.y+50, this.w-20, this.h-60, 0, 0, 20, 20);  //Draws underlaying "base" color  

    if ((this.mixBeaker() == false)) {  
      fill(this.analyte.finalC, pow(darkness, 2));  //Darkness increases quadratically over time
      rect(this.x+10, this.y+50, this.w-20, this.h-60, 0, 0, 20, 20);
    } else if (this.mixBeaker()&&(dropAmount>max)) {  //When user adds more titrant and is mixing even after endpoint
      fill(this.analyte.finalC, 255);  
      rect(this.x+10, this.y+50, this.w-20, this.h-60, 0, 0, 20, 20);
    } else if ((this.mixBeaker() == true)&&(dropAmount<max)) {  //If beaker is mixing, gradually reduce color to original
      int mixFrame = frame - mixStart;
      fill(this.analyte.finalC, max(pow(darkness, 2)-((mixFrame-20)*5), pow(darkness-6, 2)));
      //println(pow(darkness, 2)-((mixFrame-20)*5));
      rect(this.x+10, this.y+50, this.w-20, this.h-60, 0, 0, 20, 20);
    }
    //move stuff into mixBeaker() and disable button
  }

  Boolean mixBeaker() {  //Calculates whether the beaker is currently being mixed
    if ((this.mixPress)&&(dropAmount<max)) {  //If there is less than max titrant in the beaker, can still mix
      pressed = false;  //Stops the burette from dropping while mixing
      if (frame - mixStart >40) {  //when mixing has finished, sets darkness to lighter value
        darkness = max(darkness-3, 0);
        this.mixPress = false;
        failMix = false;
        return false;
      } else if (frame - mixStart > 20) {  //beaker is currently mixing
        return true;
      }
    }
    else if (this.mixPress) {  //when user tried to mix after endpoint, nothing happens
      pressed = false;
      if (frame - mixStart >40) {  //when mixing has finished
        this.mixPress = false;
        failMix = false;
        return false;
      } else if (frame - mixStart > 20) {  //beaker is currently mixing
        return true;
      }
    }
    return false;
  }
}
