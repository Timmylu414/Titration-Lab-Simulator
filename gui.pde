/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.
 
 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
 // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:490209:
  appc.background(0);
} //_CODE_:window1:490209:

public void button1_click1(GButton source, GEvent event) { //_CODE_:Drop:517747:
  if (pressed == false) {
    if (bea.mixing == false) {
      pressed = true;
      Drop.setText("stop");
      mix.setEnabled(true);
    } else {
      failMix = true;
      scientistFrame = frame;
    }
  } else { 
    pressed = false;
    Drop.setText("start");
  }
} //_CODE_:Drop:517747:

public void button1_click4(GButton source, GEvent event) { //_CODE_:Reset:319241:
  Speed.setLimits(5, 1, 20);
  Size.setLimits(8, 1, 15);
  reset();
} //_CODE_:Reset:319241:

public void slider1_change1(GSlider source, GEvent event) { //_CODE_:Speed:561848:
  frequency = Speed.getValueI();
} //_CODE_:Speed:561848:

public void slider1_change2(GSlider source, GEvent event) { //_CODE_:Size:357543:
  dropSize = Size.getValueI() + 1;
} //_CODE_:Size:357543:

public void button1_click2(GButton source, GEvent event) { //_CODE_:mix:934370:
  mixStart = frame;
  bea.mixing = true;
  Drop.setText("start");
  mix.setEnabled(false);
} //_CODE_:mix:934370:

public void button2_click1(GButton source, GEvent event) { //_CODE_:exit:601040:
  exit();
} //_CODE_:exit:601040:

public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:titration:791242:
  selectedIndex = titration.getSelectedIndex();
  reset();
} //_CODE_:titration:791242:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 300, 380, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  Drop = new GButton(window1, 14, 70, 120, 65);
  Drop.setText("Start");
  Drop.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  Drop.addEventHandler(this, "button1_click1");
  Reset = new GButton(window1, 14, 154, 120, 70);
  Reset.setText("Reset");
  Reset.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  Reset.addEventHandler(this, "button1_click4");
  Speed = new GSlider(window1, 98, 252, 190, 42, 10.0);
  Speed.setShowValue(true);
  Speed.setShowLimits(true);
  Speed.setLimits(5, 1, 20);
  Speed.setNbrTicks(20);
  Speed.setStickToTicks(true);
  Speed.setShowTicks(true);
  Speed.setNumberFormat(G4P.INTEGER, 0);
  Speed.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  Speed.setOpaque(false);
  Speed.addEventHandler(this, "slider1_change1");
  Size = new GSlider(window1, 98, 322, 190, 48, 10.0);
  Size.setShowValue(true);
  Size.setShowLimits(true);
  Size.setLimits(8, 1, 15);
  Size.setNbrTicks(15);
  Size.setStickToTicks(true);
  Size.setShowTicks(true);
  Size.setNumberFormat(G4P.INTEGER, 0);
  Size.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  Size.setOpaque(false);
  Size.addEventHandler(this, "slider1_change2");
  mix = new GButton(window1, 154, 70, 120, 64);
  mix.setText("Mix");
  mix.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  mix.addEventHandler(this, "button1_click2");
  label1 = new GLabel(window1, 14, 322, 84, 42);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Drop size");
  label1.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  label1.setOpaque(false);
  exit = new GButton(window1, 154, 154, 120, 70);
  exit.setText("Exit");
  exit.setLocalColorScheme(GCScheme.RED_SCHEME);
  exit.addEventHandler(this, "button2_click1");
  label2 = new GLabel(window1, 14, 252, 86, 48);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Drop rate");
  label2.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  label2.setOpaque(false);
  titration = new GDropList(window1, 14, 14, 140, 120, 3, 20);
  titration.setItems(loadStrings("list_791242"), 0);
  titration.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  titration.addEventHandler(this, "dropList1_click1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton Drop; 
GButton Reset; 
GSlider Speed; 
GSlider Size; 
GButton mix; 
GLabel label1; 
GButton exit; 
GLabel label2; 
GDropList titration; 
