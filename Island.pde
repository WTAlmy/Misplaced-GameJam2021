public class Island extends Plottable{
  int num_palmtrees = 0;
  int max_radius = 250;
  int min_radius = 100;
  
  Island(PVector pos, float radius){
    super(pos, radius);
  }
  
  public float getSize(){
    return this.getSize();
  }
  
  public void render(){
    noStroke();
    fill(255, 255, 0);
    PVector pos = this.getRelativePos();
    circle(pos.x, pos.y, this.getSize());
  }
}

public ArrayList<Island> generate_islands(int numIslands, float radius){
  ArrayList<Island> islands = new ArrayList<Island>();
  for (int i =0; i < numIslands; i++){
    // edit width and height for vector
    Island newIsland = new Island(new PVector(600, 400), radius);
    
    islands.add(newIsland);
  }
  return islands;
}
