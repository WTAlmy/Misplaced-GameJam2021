public static final int SHARK = 0;
public static final int JELLY = 1;

public ArrayList<Hostile> hostiles;

public class Hostile extends Plottable {

  private int type;
  
  private float angle;
  private float angle_start;
  private float target_angle;

  Hostile (int type, PVector pos) {
    super(pos);
    this.type = type;
    this.angle = random(0, TWO_PI);
    this.angle_start = millis();
    this.target_angle = random(0, TWO_PI);
  }

  Hostile (int type, PVector pos, float radius) {
    super(pos, radius);
    this.type = type;
    this.angle = random(0, TWO_PI);
    this.angle_start = millis();
    this.target_angle = random(0, TWO_PI);
  }

  public float getSize () {
    return 20;
  }
  
  private void newAngle () {
    this.angle = target_angle;
    this.angle_start = millis();
    this.target_angle = random(0, TWO_PI);
  }
  
  private PVector lerpAngle(float i) {
    PVector va = PVector.fromAngle(this.angle);
    PVector vb = PVector.fromAngle(this.target_angle);
    return va.lerp(vb, i).normalize();
  }
  
  public void update () {
    float delta = (millis() - angle_start) / 1000.0;
    if (delta > 5) newAngle();
    this.move(this.lerpAngle(delta));
    if (this.getPosition().dist(new PVector(0,0)) > 1000) {
      super.pos = new PVector(0, 0);
    }
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
      hostile.update();
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
