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
    float terrainMulti = 0.05;

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
      
      float deltaVectorX = movementX * terrainMulti;
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

      float deltaVectorY = movementY * terrainMulti;
      this.move(new PVector(0, deltaVectorY));
    }
  }
  
  public void attacked(){
    
  }
  
  public void displayInventory(float x, float y){
    textSize(16);
    fill(0);
    text("Wood: " + wood.count, x, y);
    text("Bottles: " + bottles.count, x, y - 20);
  }

  public void render() {
    stroke(0);
    fill(255, 0, 0);
    circle(center.x, center.y, this.size);
  }
}
