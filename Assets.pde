Resource bananas, potatoes;

void createResources () {
  bananas = new Resource("Banana", "https://i.pinimg.com/originals/4d/63/40/4d6340bb586909c97ad0aa717868194d.png", "png");
  potatoes = new Resource("Potatoes");
  resources.add(bananas);
  resources.add(potatoes);
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
