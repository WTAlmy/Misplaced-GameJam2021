public class Island extends Plottable{
  int num_palmtrees = 0;
  float size;

  Island(PVector pos, float radius){
    super(pos, radius);
    this.size = random(80, 150);
  }
  
  public float getSize(){
    return this.size;
  }
  
  public void render(){
    noStroke();
    fill(255, 255, 0);
    PVector pos = this.getRelativePos();
    circle(pos.x, pos.y, this.getSize());
  }
}

// given #islands and plottable radius, returns array of plotted islands
public ArrayList<Island> generate_islands(int numIslands, float radius){
  ArrayList<Island> islands = new ArrayList<Island>();
  for (int i =0; i < numIslands; i++){
    // edit width and height for vector
    Island newIsland = new Island(new PVector(width/2, height/2), radius);
    
    islands.add(newIsland);
  }
  return islands;
}

// renders all islands in an array of islands
public void render_islands(ArrayList<Island> islands){
  for (Island island: islands){
    island.render();
  }
}
