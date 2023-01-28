class Analyte {
  
  //Fields
  String name;
  float concentration;
  float volume;
  float numMol;
  color initialC;
  color finalC;
  
  //Constructor
  Analyte(String n, float c, float v, color iC, color fC) {
    this.name = n;
    this.concentration = c;
    this.volume = v;
    this.numMol = c * v;
    this.initialC = iC;
    this.finalC = fC;
  }
  
}
