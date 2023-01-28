import g4p_controls.*;
PImage lab;
PImage scientist;
int frame = 0;
int mixStart = 0;
int scientistFrame = 0;
boolean pressed = false;
boolean failMix = false;
int dropSize = 8;
float frequency = 6;
String[] values;
int selectedIndex = 0;

Titrant NaOH = new Titrant("NaOH", 0.5, 0.025);
Analyte HClpink = new Analyte("HCl", 0.25, 0.050, color(200, 200, 255), color(239, 80, 255));

Titrant HClblue = new Titrant("HCl", 0.1, 0.050);
Analyte CaOH2 = new Analyte("Ca(OH)2", 0.28, 0.020, color(37, 150, 190), color(255, 227, 19));


Beaker bea = new Beaker(HClpink, 400, 400, 200, 240); 
Burette bur = new Burette(NaOH, bea, 100, 500, 200);

//code different titrants and analytes
//set variable to current titrant and analyte





void setup() {
  values = loadStrings("values.txt");
  createGUI();
  size(1000, 700);
  frameRate(45);
  noStroke();
  background(0);

  drawBack();

  bea.drawBeaker();
  bea.fillBeaker();

  bur.drawBurette();
  bur.fillBurette();
  displayStats();
}


void draw() {  
  clear();
  drawBack();
  drawScientist();

  if (pressed == true) {
    bur.dropTitrant();
  }

  bea.drawBeaker();
  bea.fillBeaker();

  bur.drawBurette();
  bur.fillBurette();
  bur.updateDrops();


  displayStats();




  frame += 1;
}

void reset() {
  pressed = false;
  failMix = false;

  if (selectedIndex == 0) {
    bea = new Beaker(HClpink, 400, 400, 200, 240);
    bur = new Burette(NaOH, bea, 100, 500, 200);
  } else if (selectedIndex == 1) {
    bea = new Beaker(CaOH2, 400, 400, 200, 240);
    bur = new Burette(HClblue, bea, 100, 500, 200);
  }
  frequency = 5;
  dropSize = 10;
  frameRate(30);
  noStroke();
  background(0);

  drawBack();

  bea.drawBeaker();
  bea.fillBeaker();

  bur.drawBurette();
  bur.fillBurette();
  displayStats();
}

void drawBack() {
  //Draws background

  tint(255, 150);
  lab = loadImage("lab.jpg");
  lab.resize(1500, 800);
  image(lab, -100, -55);
  noTint();
}


void drawScientist() {
  noTint();
  scientist = loadImage("scientist.png");
  scientist.resize(600, 600);

  if ((failMix == true)&&(bea.mixing==true)) {
    image(scientist, 750, 250);
    rect(650, 40, 300, 180, 50);
    triangle(800, 220, 850, 220, 870, 240);
    fill(0);
    textSize(20);
    text("Wait for mixing to finish!", 680, 135);
  } else if (bea.numDrops>bea.max*3) {
    image(scientist, 750, 250);
    fill(0);
    rect(650, 40, 330, 180, 50);
    triangle(800, 220, 850, 220, 870, 240);
    fill(255, 0, 0);
    rect(885, 372, 21, 21);
    rect(969, 372, 21, 21);
    textSize(50);
    text("stop.", 750, 145);
  } else if (bea.numDrops>bea.max*2) {
    image(scientist, 750, 250);
    rect(650, 40, 330, 180, 50);
    triangle(800, 220, 850, 220, 870, 240);
    textSize(20);
    fill(255, 121, 8);
    text("Please stop adding titrant.", 680, 140);
  } else if (bea.numDrops>bea.max) {
    image(scientist, 750, 250);
    rect(650, 40, 330, 180, 50);
    triangle(800, 220, 850, 220, 870, 240);
    textSize(20);
    fill(0);
    text("Oops! You've added too", 680, 100);
    text("much titrant!", 680, 130);
    text("Press reset to try again.", 680, 180);
  }
}


void displayStats() {
  textSize(40);
  fill(255);
  text("Titration", 50, 100);
  textSize(20);
  text(bur.titrant.name + " concentration: " + bur.titrant.concentration + "M", 50, 140);
  text(bea.analyte.name + " concentration: " + "?", 50, 170);
  text("Burette amount: " + (bur.currentV) + " mL", 50, 200);
}
