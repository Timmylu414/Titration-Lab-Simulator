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

Titrant NaOH;
Analyte HClpink;

Titrant HClblue;
Analyte CaOH2;

Beaker bea;
Burette bur;

void setup() {
  values = loadStrings("values.txt");
  lab = loadImage("lab.jpg");
  lab.resize(1500, 800);
  scientist = loadImage("scientist.png");
  scientist.resize(600, 600);
  
  createGUI();
  size(1000, 700);
  frameRate(30);
  noStroke();
  drawBack();

  //Creating titrants, analytes, beakers, and burettes
  NaOH = new Titrant("NaOH", float(values[0]), float(values[1]));
  HClpink = new Analyte("HCl", float(values[2]), float(values[3]), color(200, 200, 255), color(239, 80, 255));

  HClblue = new Titrant("HCl", float(values[4]), float(values[5]));
  CaOH2 = new Analyte("Ca(OH)2", float(values[6]), float(values[7]), color(50, 180, 190), color(255, 227, 19));

  bea = new Beaker(HClpink, NaOH, 400, 400, 200, 240);
  bur = new Burette(NaOH, bea, 100, 500, 200);

  bea.drawBeaker();
  bea.fillBeaker();

  bur.drawBurette();
  bur.fillBurette();
  
  printArray(values);
  displayStats();
}

void draw() {  
  clear();
  drawBack();
  drawScientist();

  bea.drawBeaker();
  bea.fillBeaker();

  bur.drawBurette();
  bur.fillBurette();
  bur.dropTitrant();
  bur.updateDrops();
  
  displayStats();
  frame += 1;
}

void reset() {  //Resets all values 
  pressed = false;
  failMix = false;
  
  if (selectedIndex == 0) {  //Checks which titration version is selected
    bea = new Beaker(HClpink, NaOH, 400, 400, 200, 240);
    bur = new Burette(NaOH, bea, 100, 500, 200);
  } else if (selectedIndex == 1) {
    bea = new Beaker(CaOH2, NaOH, 400, 400, 200, 240);
    bur = new Burette(HClblue, bea, 100, 500, 200);
  }
  
  frequency = 5;
  dropSize = 10;

  bea.drawBeaker();
  bea.fillBeaker();

  bur.drawBurette();
  bur.fillBurette();
  displayStats();
}

void drawBack() {
  //Draws background
  tint(255, 150);
  image(lab, -100, -55);
  noTint();
}

void drawScientist() {
  
  if ((failMix == true)&&(bea.mixPress==true)) {  //When users try to start dropping again but mixing isn't finish, scientist gives them friendly reminder
    image(scientist, 750, 250);
    rect(650, 40, 300, 180, 50);
    triangle(800, 220, 850, 220, 870, 240);
    fill(0);
    textSize(20);
    text("Wait for mixing to finish!", 680, 135);
  } else if (bea.dropAmount>bea.max*3) {  //Scientist goes insane if user adds crazy amount of titrant
    image(scientist, 750, 250);
    fill(0);
    rect(650, 40, 330, 180, 50);
    triangle(800, 220, 850, 220, 870, 240);
    fill(255, 0, 0);
    rect(885, 372, 21, 21);
    rect(969, 372, 21, 21);
    textSize(50);
    text("stop.", 750, 145);
  } else if (bea.dropAmount>bea.max*2) {  //Scientist gets upset if user adds way more titrant than needed
    image(scientist, 750, 250);
    rect(650, 40, 330, 180, 50);
    triangle(800, 220, 850, 220, 870, 240);
    textSize(20);
    fill(255, 121, 8);
    text("Please stop adding titrant.", 680, 140);
  } else if ((bea.dropAmount)>bea.max) {  //Scientist announces that you have exceeded endpoint
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

void displayStats() {  //displays values of concentrations, volumes, and amount titrated
  textSize(40);
  fill(255);
  text("Titration", 50, 100);
  textSize(20);
  text(bur.titrant.name + " concentration: " + bur.titrant.concentration + " mol/L", 50, 140);
  text(bur.titrant.name + " added: " + bea.dropAmount + " L", 50, 170);
  text(bea.analyte.name + " concentration: " + "?", 50, 200);
  text(bea.analyte.name + " volume: " + bea.analyte.volume + " L", 50, 230);
}

float roundThousandth(float f) {  //rounds values to the nearest thousandth
  f = float(round(f*1000));
  f = f/1000;
  return f;
}
