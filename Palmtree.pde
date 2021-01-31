public class Palmtree extends Plottable {
  float size;
  PImage palmtreeImage;
  
  Palmtree(PVector pos, float radius) {
    super(pos, radius);
    this.size = 10;
  }

  // access 
  public float getSize() {
    return this.size;
  }

  // render palmtree
  public void render() {
    PImage img = this.palmtreeImage;
    if (img != null){
      PVector pos = this.getRelativePos();
      image(img, pos.x, pos.y);
    } else {
    noStroke();
    fill(0, 255, 0);
    circle(this.getPosition().x, this.getPosition().y, size);
    }
  }
}
