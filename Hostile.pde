public static final int SHARK = 0;
public static final int JELLY = 1;

PImage shark_sheet;
PImage shark_frame[] = new PImage[7];

PImage jelly_sheet;
PImage jelly_frame[] = new PImage[9];

public ArrayList<Hostile> hostiles;

public class Hostile extends Plottable {

  private int type;
  
  private float angle;
  private float angle_start;
  private float target_angle;
  
  private float x_movement = 1;

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
    return 32;
  }
  
  private void newAngle () {
    this.angle = target_angle;
    this.angle_start = float(millis());
    this.target_angle = random(0, TWO_PI);
  }
  
  private PVector lerpAngle(float i) {
    PVector va = PVector.fromAngle(this.angle);
    PVector vb = PVector.fromAngle(this.target_angle);
    return va.lerp(vb, i).normalize();
  }
  
  public void update () {
    float delta = (float(millis()) - angle_start) / 1000.0;
    if (delta > 5) newAngle();
    PVector movement = this.lerpAngle(delta);
    this.move(movement);
    this.x_movement = movement.x;
    if (this.getPosition().dist(new PVector(0,0)) > 1500) {
      super.pos = new PVector(0, 0);
    }
  } 

  public void render () {
    PVector loc = this.getRelativePos();
    switch (this.type) {
    case SHARK: {
      int frame = int(frameCount * 0.2) % 7;
      if (this.x_movement > 0) {
        image(shark_frame[frame], loc.x, loc.y, this.getSize(), this.getSize());
      } else {
        pushMatrix();
        scale(-1, 1);
        image(shark_frame[frame], -loc.x, loc.y, this.getSize(), this.getSize());
        popMatrix();
      }
      break;
    } case JELLY: {
      int frame = int(frameCount * 0.2) % 9;
      if (this.x_movement > 0) {
        image(jelly_frame[frame], loc.x, loc.y, this.getSize(), this.getSize());
      } else {
        pushMatrix();
        scale(-1, 1);
        image(jelly_frame[frame], -loc.x, loc.y, this.getSize(), this.getSize());
        popMatrix();
      }
      break;
    }}
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
  shark_sheet = loadImage("shark_sprite.png", "png");
  jelly_sheet = loadImage("jelly_sprite.png", "png");
  for (int i = 0; i < 7; i++) {
    shark_frame[i] = shark_sheet.get((i%5) * 128, int(i/5)*128, 128, 128);
  }
  for (int i = 0; i < 9; i++) {
    jelly_frame[i] = jelly_sheet.get(1 + (i%5) * 129, int(i/5)*129, 128, 128);
  }
  for (int i = 0; i < count; i++) {
    if (random(1.0) > 0.5) {
      hostiles.add(new Hostile(SHARK, center, radius));
    } else {
      hostiles.add(new Hostile(JELLY, center, radius));
    }
  }
}
