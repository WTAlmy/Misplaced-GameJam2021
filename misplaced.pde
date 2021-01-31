PVector center;
ArrayList<Island> islands;

PImage background_image;

void settings () {
  size(1200, 800, P2D);
  pixelDensity(2);
}

void setup () {
  frameRate(60);
  imageMode(CENTER);
  center = new PVector(width/2, height/2);  
  
  background_image = loadImage("seamless.jpg");
  create_background();
  islands = generate_islands(30, 1000);
  createResources();
  generateHostiles(50, 1500.0);  
}

void draw () {
  background(0, 0, 255);
  renderHostiles();
  handle_background();
  render_islandWater(islands);
  render_islandBackground(islands);
  render_islands(islands);
  player.update();
  player.render();
  renderResources();
  noFill();
  stroke(255);
  textSize(12);
  text(frameRate, width-50, height/3);
  text(player.getPosition().x, width-50, height/3+30);
  text(player.getPosition().y, width-50, height/3+60);
  player.displayInventory(1000.0, 600.0);
}
