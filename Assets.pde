SoundFile pickup;
Resource bananas, potatoes, wood, bottles;
ArrayList<ResourceInstance> bottleArray;

void createResources () {
  bananas = new Resource("Banana", "https://i.pinimg.com/originals/4d/63/40/4d6340bb586909c97ad0aa717868194d.png", "png");
  potatoes = new Resource("Potatoes");
  wood = new Resource("Wood", "logsNoBackground copy.png", "png");
  bottles = new Resource("Bottle", "waterBottleNoBackground.png", "png");
  bottleArray = new ArrayList<ResourceInstance>();
  
  resources.add(bananas);
  resources.add(potatoes);
  resources.add(wood);
  resources.add(bottles);
  pickup = new SoundFile(this, "collect.mp3");
}

class PotatoInstance extends ResourceInstance {
  PotatoInstance (PVector pos, float radius) {
    super(potatoes, pos, radius);
  }
  public float getSize () {
    return 30;
  }
}

class BananaInstance extends ResourceInstance {
  private float actual_size;
  BananaInstance (PVector pos, float radius) {
    super(bananas, pos, radius);
    this.actual_size = random(15, 45);
  }
  public float getSize () {
    return this.actual_size;
  }
}

class WoodInstance extends ResourceInstance {
  WoodInstance (PVector pos, float radius) {
    super(wood, pos, radius);
  }
  public float getSize () {
    return 35;
  }
}

class BottleInstance extends ResourceInstance {

  BottleInstance(PVector pos, float radius) {
    super(bottles, pos, radius);
    bottles.loadedImage.resize(15, 0);
  }

  public float getSize() {
    return 35;
  }

  public void render() {
    float floatVal = sin(millis()/600.0);
    PImage img = bottles.getImage();
    PVector pos = this.getRelativePos();
    float size = this.getSize();
    if (img != null) {
      image(img, pos.x, pos.y + floatVal*10, size, size);
    } else {
      fill(255);
      stroke(0);
      circle(pos.x, pos.y + floatVal*50.0, size);
    }
  }
}

public void generate_bottles(int amount, float radius) {
  for (int i = 0; i < amount; i++){
    BottleInstance newBottle = new BottleInstance(new PVector(0, 0), radius);
    bottleArray.add(newBottle);
 
    // remove bottle from intances, need to render separatley
    bottles.instances.remove(newBottle);
  }
}

public void render_bottles(ArrayList<ResourceInstance> bottleArray){
  for (ResourceInstance bottle: bottleArray){
    if (bottle.visible()){
      bottle.render();
    }
  }
}
