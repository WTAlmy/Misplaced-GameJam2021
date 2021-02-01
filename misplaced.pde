import processing.sound.*;

PVector center;
ArrayList<Island> islands;

SoundFile file;
PImage background_image;

float luminosity;
float island_lum;
float hostile_lum;

int PROGRAM_STATE;

void settings () {
  
  size(1200, 800, P2D);
  pixelDensity(2);
  file = new SoundFile(this, "waves.mp3");
  jellySound = new SoundFile(this, "electricshock.mp3");
  sharkSound = new SoundFile(this, "sharkSound.mp3");
  playerDeathSound = new SoundFile(this, "deathSound.mp3");
  background_image = loadImage("seamless.jpg");
  center = new PVector(width/2, height/2);
  
  PROGRAM_STATE = 0;
  
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

//void draw () {
//  luminosity = sin(frameCount / 999.0);
//  island_lum = map(luminosity, -1, 1, 0.2, 1);
//  hostile_lum = map(luminosity, -1, 1, 1, 0.3);
//  background(0, 0, 255.0 * luminosity);
//  renderHostiles();
//  handle_background();
//  render_islandWater(islands);
//  render_bottles(bottleArray);
//  render_islandBackground(islands);
//  render_islands(islands);
//  player.update();
//  player.render();
//  player.attacked();
//  renderResources();
//  noFill();
//  stroke(255);
//  textSize(12);
//  text(frameRate, width-50, height/3);
//  text(player.getPosition().x, width-50, height/3+30);
//  text(player.getPosition().y, width-50, height/3+60);
//  player.displayInventory(1000.0, 600.0);
//=======
//}

void text_render () {
  textSize(128);
  text("Misplaced", center.x, center.y - 200);
  textSize(64);
  text("Press E to begin playing", center.x, center.y - 100);
  textSize(48);
  text("Controls:", center.x, center.y + 100);
  text("Press E to pick up bottles or wood", center.x, center.y + 140);
  text("Press F to punch trees or sharks", center.x, center.y + 180);
  text("Press R to reload or regenerate", center.x, center.y + 220);
}

void death_text () {
  textSize(256);
  text("You Died", center.x, center.y - 100);
  textSize(64);
  text("Press R to reload or regenerate", center.x, center.y + 100);
}

void win_text () {
  textSize(256);
  text("You Won!", center.x, center.y - 100);
  textSize(64);
  text("Press R to reload or regenerate", center.x, center.y + 100);
  text("Press Q to exit", center.x, center.y - 100);
}

void draw () {
  luminosity = 1;
  island_lum = 1;
  hostile_lum = 1;
  switch(PROGRAM_STATE) {
    case 0: {
      background(0, 0, 255);
      renderHostiles();
      handle_background();
      render_islandWater(islands);
      render_islandBackground(islands);
      render_islands(islands);
      textAlign(CENTER);
      // Black Text
      fill(0);
      pushMatrix();
        translate(-1, -1);
        text_render();
        translate(2, 0);
        text_render();
        translate(0, 2);
        text_render();
        translate(-2, 0);
        text_render();
      popMatrix();
      // White Text
      fill(255);
      text_render();
      break;
    }
    case 1: {
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
      player.playerWin();
      renderResources();
      noFill();
      stroke(255);
      textSize(12);
      text(frameRate, width-50, height/3);
      text(player.getPosition().x, width-50, height/3+30);
      text(player.getPosition().y, width-50, height/3+60);
      player.displayInventory(1000.0, 600.0);
      break;
    }
    case 2: {
      background(0, 0, 255);
      renderHostiles();
      handle_background();
      render_islandWater(islands);
      render_islandBackground(islands);
      render_islands(islands);
      textAlign(CENTER);
      // Black Text
      fill(0);
      pushMatrix();
        translate(-1, -1);
        //text_render();
        death_text();
        translate(2, 0);
        //text_render();
        death_text();
        translate(0, 2);
        //text_render();
        death_text();
        translate(-2, 0);
        //text_render();
        death_text();
      popMatrix();
      // White Text
      fill(255, 50, 50);
      //text_render();
      death_text();
      break;
    }
    case 3: {
      background(0, 0, 255);
      renderHostiles();
      handle_background();
      render_islandWater(islands);
      render_islandBackground(islands);
      render_islands(islands);
      textAlign(CENTER);
      // Black Text
      fill(0);
      pushMatrix();
        translate(-1, -1);
        //text_render();
        win_text();
        translate(2, 0);
        //text_render();
        win_text();
        translate(0, 2);
        //text_render();
        win_text();
        translate(-2, 0);
        //text_render();
        win_text();
      popMatrix();
      // White Text
      fill(255, 50, 50);
      //text_render();
      win_text();
      break;
      
    }
  }  
}
