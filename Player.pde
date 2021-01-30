Player player = new Player(new PVector(0,0));

public class Player extends Plottable{
  private float size;
  
  Player(PVector pos){
    super(pos);
    this.size = 15;
  }
  
  public float getSize(){
    return this.size;
  }
  
  public void render(){
    stroke(0);
    fill(255, 0, 0);
    circle(this.getPosition().x, this.getPosition().y, this.size);
  }
}
