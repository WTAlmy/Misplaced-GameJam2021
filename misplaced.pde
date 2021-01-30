PVector center;
ArrayList<Island> islands = generate_islands(30, 1000);

void setup () {
  size(1200, 800, P2D);
  center = new PVector(width/2, height/2);
  frameRate(60);
}

void draw () {
  background(0, 0, 255);
  render_islands(islands);
  player.update();
  player.render();
  
}
