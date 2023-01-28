class Titrant {
  
  //Fields
  String name;
  float concentration;
  float volume;
  float mol;
  
  //Constructor
  Titrant(String n, float c, float v) {
    this.name = n;
    this.concentration = c;
    this.volume = v;
    this.mol = c * v;
  }
  
}
