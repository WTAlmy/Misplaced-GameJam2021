public class Palmtree extends Plottable {
  float size;

  Palmtree(PVector pos, float radius) {
    super(pos, radius);
    this.size = 10;
  }

  // access
  public float getSize() {
    return this.size;
  }

  // render
  public void render() {
    noStroke();
    fill(0, 255, 0);
    circle(this.getRelativePos().x, this.getRelativePos().y, size);
  }
}
