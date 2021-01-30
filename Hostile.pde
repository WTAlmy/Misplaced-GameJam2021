public static final int SHARK = 0;
public static final int JELLY = 1;

public ArrayList<Hostile> hostiles;

public class Hostile extends Plottable {
  
  private int type;
  
  Hostile (int type, PVector pos) {
    super(pos);
    this.type = type;
  }
  
  Hostile (int type, PVector pos, float radius) {
    super(pos, radius);
    this.type = type;
  }
  
  public float getSize () {
    return 20;
  }
  
  public void render () {
    PVector loc = this.getRelativePos();
    switch (this.type) {
      case SHARK:
        fill(80, 80, 80);
        stroke(255);
        ellipse(loc.x, loc.y, this.getSize(), this.getSize() * 3);
        break;
      case JELLY:
        fill(255, 200, 200);
        stroke(127);
        circle(loc.x, loc.y, this.getSize());
        break;
    }
  }
  
}

public void renderHostiles () {
  for (Hostile hostile : hostiles) {
    if (hostile.visible()) {
      hostile.render();
    }
  }
}

public void generateHostiles (int count, float radius) {
  hostiles = new ArrayList<Hostile>();
  for (int i = 0; i < count; i++) {
    if (random(1.0) > 0.5) {
      hostiles.add(new Hostile(SHARK, center, radius));
    } else {
      hostiles.add(new Hostile(JELLY, center, radius));
    }
  }
}
