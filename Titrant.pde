class Titrant {
  
  //Fields
  String name;
  float concentration;
  float volume;
  float numMol;
  
  //Constructor
  Titrant(String n, float c, float v) {
    this.name = n;
    this.concentration = c;
    this.volume = v;
    this.numMol = c * v;
  }
  
}
