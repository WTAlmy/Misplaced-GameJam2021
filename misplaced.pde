PVector center;
ArrayList<Island> islands = generate_islands(30, 1000);

void settings () {
  size(1200, 800, P2D);
  frameRate(60);
  imageMode(CENTER);
}

void setup () {
  center = new PVector(width/2, height/2);
}

void draw () {
  background(0, 0, 255);
  render_islands(islands);
  player.update();
  player.render();
}
