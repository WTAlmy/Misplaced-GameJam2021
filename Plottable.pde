public abstract class Plottable {
  
  private PVector pos;
  private float size;
  
  public float min_size = 1;
  public float max_size = 300;
  
  // Constructors
  
  //
  // Create a Plottable at a given location
  //
  Plottable (PVector pos) {
    float size = random(this.min_size, this.max_size);
    this.pos = pos.copy();
    this.size = size;
  }
  
  //
  // Create a Plottable within a radius of a given location
  //
  Plottable (PVector pos, float radius) {
    float size = random(this.min_size, this.max_size);
    float distance = random(radius / 20, radius);
    PVector offset = PVector.random2D().mult(distance);
    this.pos = PVector.add(pos, offset);
    this.size = size;
  }
  
  // Access Functions
  
  public float getSize () {
    return this.size;
  }
  
  public PVector getPosition () {
    return this.pos.copy();
  }
  
  public PVector getRelativePos () {
    return this.pos.copy();
  }
  
  // Modifier Functions
  
  public void move (PVector delta) {
    this.pos.add(delta);
  }
  
  // Processing
  
  public abstract void render ();

}
