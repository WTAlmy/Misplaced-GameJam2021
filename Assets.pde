Resource bananas = new Resource("Banana", "https://lh3.googleusercontent.com/proxy/VHJwSGF86sZObPtw8n9egmktGkSGlNYb48ckuTPAUpF0oHolOZc6JuFzp5C8unPM3RSEP04ABT21X3lxKn41XyYp-ELVU6AF8rxxedE1SiYLMue_8_wk", "png");
Resource potatoes = new Resource("Potatoes");

class PotatoInstance extends ResourceInstance {
    PotatoInstance (PVector pos, float radius) {
      super(potatoes, pos, radius);
    }
    public float getSize () {
      return 30;
    }
}

class BananaInstance extends ResourceInstance {
    private float min_size = 15;
    private float max_size = 45;
    private float actual_size;
    BananaInstance (PVector pos, float radius) {
      super(bananas, pos, radius);
      this.actual_size = random(min_size, max_size);
    }
    public float getSize () {
      return this.actual_size;
    }
}
