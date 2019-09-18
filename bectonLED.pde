// References:
// CPSC 334 Task 1 group portion, see https://github.com/slongarama/cpsc334-generative-art
// Particle class: https://processing.org/examples/simpleparticlesystem.html
// Smoke: https://www.openprocessing.org/sketch/711218

// ----------------------------------------------------------------------
// SETUP
// ----------------------------------------------------------------------

PImage img;

void setup() {
  frameRate(24);
  fullScreen();

  // Load images
  imageMode(CENTER);
  img = loadImage("media/child.png");
  img.resize(width, height);

  // Load rectangle positions for smaller LED displays. Create particle 
  // system that will show a bouncing "ball" in each small panel
  loadRectangles();
  ps.addParticles();  

  // Load text files
  textSetup();
}

// ----------------------------------------------------------------------
// DRAW
// ----------------------------------------------------------------------

void draw() {
  background(#0A4500);
  background(img);
  ps.run();
  drawSmoke();
  drawMovingText();
  drawBlockText();
}
