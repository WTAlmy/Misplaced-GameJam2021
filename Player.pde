Player player = new Player(new PVector(0, 0));

public class Player extends Plottable {
  private float size;

  Player(PVector pos) {
    super(pos);
    this.size = 15;
  }

  public float getSize() {
    return this.size;
  }

  public void update() {
    float movementX = mouseX - center.x;
    float movementY = mouseY - center.y;

    if (abs(movementX) > 5) {
      if (abs(movementX) > 150) {
        if (movementX > 0) {
          movementX = 150;
        } else {
          movementX = -150;
        }
      }
      float deltaVectorX = movementX * 0.051;
      this.move(new PVector(deltaVectorX, 0));
    }

    if (abs(movementY) > 5) {
      if (abs(movementY) > 150) {
        if (movementY > 0) {
          movementY = 150;
        } else {
          movementY = -150;
        }
      }
      float deltaVectorY = movementY* 0.051;
      this.move(new PVector(0, deltaVectorY));
    }
  }

  public void render() {
    stroke(0);
    fill(255, 0, 0);
    circle(center.x, center.y, this.size);
  }
}
