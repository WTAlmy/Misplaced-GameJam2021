ArrayList<Resource> resources = new ArrayList<Resource>();

public class Resource {
  
  private String name;
  private PImage loadedImage;
  private ArrayList<ResourceInstance> instances;
  
  Resource (String name) {
    this.name = name;
    this.instances = new ArrayList<ResourceInstance>();
  }
  
  Resource (String name, String imagePath) {
    this.name = name;
    this.loadedImage = loadImage(imagePath);
    this.instances = new ArrayList<ResourceInstance>();
  }
  
  Resource (String name, String imagePath, String type) {
    this.name = name;
    this.loadedImage = loadImage(imagePath, type);
    this.instances = new ArrayList<ResourceInstance>();
  }
  
  public String getName () {
    return this.name;
  }
  
  public PImage getImage () {
    return this.loadedImage;
  }
  
  public ArrayList<ResourceInstance> getInstances () {
    return this.instances;
  }
  
  public void addInstance (ResourceInstance instance) {
    this.instances.add(instance);
  }
  
  // Processing
  public void renderInstances () {
    for (ResourceInstance resource : this.instances) {
      resource.render();
    }
  }
  
}

public abstract class ResourceInstance extends Plottable {
  
  private Resource resource;
  
  public ResourceInstance (Resource type, PVector pos) {
    super(pos);
    this.resource = type;
    this.resource.addInstance(this);
  }
  
  public ResourceInstance (Resource type, PVector pos, float radius) {
    super(pos, radius);
    this.resource = type;
    this.resource.addInstance(this);
  }
  
  //
  // Default rendering in case Resource Instance does not override
  //
  public void render () {
    PImage img = this.resource.getImage();
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
