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
    float distance = random(-radius, radius);
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

  public float distTo (Plottable other) {
    return this.pos.dist(other.getPosition());
  }

  public boolean touching (Plottable other) {
    float larger = 0.5 * max(this.getSize(), other.getSize());
    if (this.distTo(other) <= larger) {
      return true;
    }
    return false;
  }

  public boolean visible () {
    if (this.distTo(player) < (width / 2) + (height / 4) + this.getSize()) {
      return true;
    }
    return false;
  }

  // Modifier Functions

  public void move (PVector delta) {
    this.pos.add(delta);
  }

  // Processing

  public abstract void render ();
}

public ArrayList<Background> tiles;

public class Background extends Plottable {
  
  Background (PVector pos) {
    super(pos);
    tiles.add(this);
  }
  
  public float getSize () {
    return 1000;
  }
  
  public void update () {
    if (frameCount % 4 == 0) {
      this.move(new PVector(1, 1));
    }
    if (super.pos.x >= 3064) {
      super.pos.x = -3064;
    }
    if (super.pos.y >= 3064) {
      super.pos.y = -3064;
    }
  }
  
  public void render () {
    if (this.visible()) {
      tint(255, 80);
      PVector local = this.getRelativePos();
      image(background_image, local.x, local.y);
      tint(255, 255);
    }
  }
}

public void create_background () {
  tiles = new ArrayList<Background>();
  for (int i = -2560; i <= 2560; i += 1024) {
    for (int j = -2560; j <= 2560; j += 1024) {
      new Background(new PVector(i, j)).update();
    }
  } 
}

public void handle_background () {
  for (Background b : tiles) {
    b.update();
    b.render();
  }
}
  
  
