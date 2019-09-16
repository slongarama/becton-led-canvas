// References:
// CPSC 334 Task 1 group portion, see https://github.com/slongarama/cpsc334-generative-art
// Particle class: https://processing.org/examples/simpleparticlesystem.html

// ----------------------------------------------------------------------
// SETUP
// ----------------------------------------------------------------------

PImage img;

void setup() {
  fullScreen();

  // Load images
  imageMode(CENTER);
  tint(255, 100);
  img = loadImage("media/stephen.png");
  img.resize(width, height);

  // Load rectangle positions for smaller LED displays.
  // Create particle system that will have a bouncing "ball"
  // in each display
  loadRectangles();
  ps.addParticles();  

  // Load text files
  textSetup();
}

// ----------------------------------------------------------------------
// DRAW
// ----------------------------------------------------------------------

void draw() {
  background(img);
   
  drawMovingText();
  drawBlockText();
  ps.run();
  drawSmoke();
}
