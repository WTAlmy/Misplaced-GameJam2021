SoundFile pickup;
Resource bananas, potatoes, wood, bottles;

void createResources () {
  bananas = new Resource("Banana", "https://i.pinimg.com/originals/4d/63/40/4d6340bb586909c97ad0aa717868194d.png", "png");
  potatoes = new Resource("Potatoes");
  wood = new Resource("Wood", "logsNoBackground copy.png", "png");
  resources.add(bananas);
  resources.add(potatoes);
  resources.add(wood);
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
