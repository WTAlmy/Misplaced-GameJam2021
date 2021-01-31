ArrayList<Resource> resources = new ArrayList<Resource>();

public class Resource {
  
  private String name;
  private int count;
  private PImage loadedImage;
  private ArrayList<ResourceInstance> instances;
  
  Resource (String name) {
    this.name = name;
    this.count = 0;
    this.instances = new ArrayList<ResourceInstance>();
  }
  
  Resource (String name, String imagePath) {
    this.name = name;
    this.count = 0;
    this.loadedImage = loadImage(imagePath);
    this.instances = new ArrayList<ResourceInstance>();
  }
  
  Resource (String name, String imagePath, String type) {
    this.name = name;
    this.count = 0;
    this.loadedImage = loadImage(imagePath, type);
    this.instances = new ArrayList<ResourceInstance>();
  }
  
  public String getName () {
    return this.name;
  }
  
  public int getCount () {
    return this.count;
  }
  
  public PImage getImage () {
    return this.loadedImage;
  }
  
  public ArrayList<ResourceInstance> getInstances () {
    return this.instances;
  }
  
  // Modifier Functions
  
  public void collect (int count) {
    this.count += count;
  }
  
  public void addInstance (ResourceInstance instance) {
    this.instances.add(instance);
  }
  
  // Processing
  public void renderInstances () {
    for (ResourceInstance inst : this.instances) {
      if (inst.visible()) {
        inst.render();
      }
    }
  }
  
}

public abstract class ResourceInstance extends Plottable {
  
  private Resource parent;
  
  public ResourceInstance (Resource type, PVector pos) {
    super(pos);
    this.parent = type;
    this.parent.addInstance(this);
  }
  
  public ResourceInstance (Resource type, PVector pos, float radius) {
    super(pos, radius);
    this.parent = type;
    this.parent.addInstance(this);
  }
  
  //
  // Default rendering in case Resource Instance does not override
  //
  public void render () {
    PImage img = this.parent.getImage();
    PVector pos = this.getRelativePos();
    float size = this.getSize();
    if (img != null) {
      image(img, pos.x, pos.y, size, size);
    } else {
      fill(255);
      stroke(0);
      circle(pos.x, pos.y, size);
    }
  }
  
}

public void renderResources() {
  for (Resource resource : resources) {
    resource.renderInstances();
  }
}
