public abstract class Plottable {
  
  private PVector pos;
  
  // Constructors
  
  //
  // Create a Plottable at a given location
  //
  Plottable (PVector pos) {
    this.pos = pos.copy();
  }
  
  //
  // Create a Plottable within a radius of a given location
  //
  Plottable (PVector pos, float radius) {
    float distance = random(radius / 20, radius);
    PVector offset = PVector.random2D().mult(distance);
    this.pos = PVector.add(pos, offset);
  }
  
  // Access Functions
  
  public abstract float getSize ();
  
  public PVector getPosition () {
    return this.pos.copy();
  }
  
  public PVector getRelativePos () {
    PVector delta = player.getPosition().sub(this.pos);
    return center.copy().sub(delta);
  }
  
  // Modifier Functions
  
  public void move (PVector delta) {
    this.pos.add(delta);
  }
  
  // Processing
  
  public abstract void render ();

}
