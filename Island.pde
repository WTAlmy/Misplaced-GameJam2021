public class Island extends Plottable {
  ArrayList<Palmtree> palmtrees;

  private float size;
  private int numPalmtrees;

  Island(PVector pos, float radius) {
    super(pos, radius);
    this.size = random(80, 150);
    palmtrees = new ArrayList<Palmtree>();
    numPalmtrees = int(random(5, 10));
  }

  // access 
  public float getSize() {
    return this.size;
  }
  public int getNumPalmtrees() {
    return this.numPalmtrees;
  }

  // fill island with palmtrees
  public void insertPalmtrees() {
    for (int i = 0; i < numPalmtrees; i++) {
      palmtrees.add(new Palmtree(this.getPosition(), this.getSize()/2 - 5)); // palmtree radius=5
    }
  }

  // Render 
  public void render() {
    noStroke();
    fill(255, 255, 0);
    PVector pos = this.getRelativePos();
    circle(pos.x, pos.y, this.getSize());
  }

  public void renderPalmtrees() {
    for (Palmtree palmtree : this.palmtrees) {
      palmtree.render();
    }
  }
}

// generate islands in radius
public ArrayList<Island> generate_islands(int numIslands, float radius) {
  ArrayList<Island> islands = new ArrayList<Island>();
  for (int i =0; i < numIslands; i++) {
    Island newIsland = new Island(new PVector(width/2, height/2), radius);
    newIsland.insertPalmtrees();
    islands.add(newIsland);
  }
  return islands;
}

// renders all islands + palmtrees
public void render_islands(ArrayList<Island> islands) {
  for (Island island : islands) {
    island.render();
  }
  // render palmtrees after all islands have been rendered
  for (Island island : islands) {
    island.renderPalmtrees();
  }
}
