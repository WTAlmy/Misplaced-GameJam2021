public class Island extends Plottable {
  ArrayList<Palmtree> palmtrees;
  ArrayList<WoodInstance> woodLogs;

  private float size;
  private int numPalmtrees;
  public float borderSize;

  Island(PVector pos, float radius) {
    super(pos, radius);
    this.size = random(80, 150);
    palmtrees = new ArrayList<Palmtree>();
    this.numPalmtrees = int(random(3, 7));
    this.borderSize = random(this.getSize()/6, this.getSize()/4);
  }

  // access 
  public float getSize() {
    return this.size;
  }
  public int getNumPalmtrees() {
    return this.numPalmtrees;
  }

  public void addLog() {
    WoodInstance woodLog = new WoodInstance(this.getPosition(), 5.0);
    woodLogs.add(woodLog);
  }

  // fill island with palmtrees
  public void insertPalmtrees() {
    for (int i = 0; i < numPalmtrees; i++) {
      Palmtree newPalmtree = new Palmtree(this.getPosition(), this.getSize()/2 - 5); // palmtree radius=5
      newPalmtree.palmtreeImage = loadImage("palmtreeNoBackground-min.png");
      newPalmtree.palmtreeImage.resize(40, 0);
      palmtrees.add(newPalmtree);
    }
  }

  // Render island
  public void render() {
    noStroke();
    PVector pos = this.getRelativePos();
    fill(245 * island_lum, 235 * island_lum, 214 * island_lum);
    circle(pos.x, pos.y, this.getSize());
  }

  // render teal water color under island and beach
  public void renderIslandWater() {
    noStroke();
    PVector pos = this.getRelativePos();
    fill(93 * island_lum, 206 * island_lum, 231 * island_lum);
    float waterBorder = this.getSize() + this.borderSize;
    float wave = sin(float(millis()) / 1500.0);
    circle(pos.x, pos.y, waterBorder + abs(wave)*20);
  }

  // render light color border behind island
  public void renderBeach() {
    noStroke();
    PVector pos = this.getRelativePos();
    fill(253 * island_lum, 251 * island_lum, 249 * island_lum);
    circle(pos.x, pos.y, this.getSize() + this.borderSize);
  }

  // render all palmtrees belonging to island
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
    Island newIsland = new Island(new PVector(0, 0), min(radius, 200 * i));
    newIsland.insertPalmtrees();
    islands.add(newIsland);
  }
  return islands;
}

// render island water
public void render_islandWater(ArrayList<Island> islands) {
  for (Island island : islands) {
    island.renderIslandWater();
  }
}

// renders island background
public void render_islandBackground(ArrayList<Island> islands) {
  for (Island island : islands) {
    island.renderBeach();
  }
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

public boolean onWater () {
  for (Island island : islands) {
    if (player.touching(island)) {
      return false;
    }
  }
  return true;
}
