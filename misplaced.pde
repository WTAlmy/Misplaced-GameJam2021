import processing.sound.*;

PVector center;
ArrayList<Island> islands;

SoundFile file;
PImage background_image;

float luminosity;
float island_lum;
float hostile_lum;

void settings () {
  
  size(1200, 800, P2D);
  pixelDensity(2);
  file = new SoundFile(this, "waves.mp3");
  jellySound = new SoundFile(this, "electricshock.mp3");
  sharkSound = new SoundFile(this, "sharkSound.mp3");
  playerDeathSound = new SoundFile(this, "deathSound.mp3");
  background_image = loadImage("seamless.jpg");
  center = new PVector(width/2, height/2);
  
  create_background();
  createResources();
  islands = generate_islands(30, 1200.0);
  generateHostiles(90, 1500.0);  
  generateBottles(20, 1200.0);
}

void setup () {
  frameRate(60);
  imageMode(CENTER);
  file.amp(0.3);
  file.loop();
}

void draw () {
  luminosity = sin(frameCount / 999.0);
  island_lum = map(luminosity, -1, 1, 0.2, 1);
  hostile_lum = map(luminosity, -1, 1, 1, 0.3);
  background(0, 0, 255.0 * luminosity);
  renderHostiles();
  handle_background();
  render_islandWater(islands);
  render_bottles(bottleArray);
  render_islandBackground(islands);
  render_islands(islands);
  player.update();
  player.render();
  player.attacked();
  renderResources();
  noFill();
  stroke(255);
  textSize(12);
  text(frameRate, width-50, height/3);
  text(player.getPosition().x, width-50, height/3+30);
  text(player.getPosition().y, width-50, height/3+60);
  player.displayInventory(1000.0, 600.0);
}
