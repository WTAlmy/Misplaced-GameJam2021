import processing.sound.*;

PVector center;
ArrayList<Island> islands;

SoundFile file;
PImage background_image;

void settings () {
  
  size(1200, 800, P2D);
  pixelDensity(2);
  file = new SoundFile(this, "waves.mp3");
  background_image = loadImage("seamless.jpg");
  center = new PVector(width/2, height/2);
  
  create_background();
  createResources();
  generateHostiles(50, 1500.0);
  islands = generate_islands(30, 1000);
  generateHostiles(50, 1500.0); 
  generate_bottles(30, 1500.0);
}

void setup () {
  frameRate(120);
  imageMode(CENTER);
  file.amp(0.3);
  file.play();
}

void draw () {
  background(0, 0, 255);
  renderHostiles();
  handle_background();
  render_islandWater(islands);
  render_bottles(bottleArray);
  render_islandBackground(islands);
  render_islands(islands);
  player.update();
  player.attacked();
  //player.status();
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
