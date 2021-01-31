PVector center;
ArrayList<Island> islands = generate_islands(30, 1000);

void settings () {
  size(1200, 800, P2D);
}

void setup () {
  frameRate(60);    
  imageMode(CENTER);
  center = new PVector(width/2, height/2);
  generateHostiles(50, 1000.0);
}

void draw () {
  background(0, 0, 255);
  render_islands(islands);
  player.update();
  player.render();
  renderHostiles();
}
