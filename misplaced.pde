PVector center;
ArrayList<Island> islands = generate_islands(30, 1000);

PImage background_image;

void settings () {
  size(1200, 800, P2D);
}

void setup () {
  frameRate(60);
  imageMode(CENTER);
  center = new PVector(width/2, height/2);  
  background_image = loadImage("seamless.jpg");
  create_background();
  
  createResources();
  generateHostiles(50, 1000.0);  
}

void draw () {
  background(0, 0, 255);
  renderHostiles();
  handle_background();
  render_islands(islands);
  player.update();
  player.render();
  renderResources();
  noFill();
  stroke(255);
  text(frameRate, width/2, height/3);
  player.displayInventory(1000.0, 600.0);
}
