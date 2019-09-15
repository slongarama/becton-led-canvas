// References:
// CPSC 334 Task 1 group portion, see https://github.com/slongarama/cpsc334-generative-art
// Particle class: https://processing.org/examples/simpleparticlesystem.html

// ----------------------------------------------------------------------
// SETUP
// ----------------------------------------------------------------------

ArrayList<Rectangle> bectonScreens = new ArrayList<Rectangle>();
String[] rectangles;

PImage img;

boolean state = false;
float[] rectUpperLeft = { 0, 0 };
float[] rectBottomRight = { 0, 0 };


void setup() {
  frameRate(2);
  fullScreen();

  // Load images
  imageMode(CENTER);
  img = loadImage("media/brush.jpg");

  // Bouncing balls
   //see bounce.pde

  // Draw rectangles
  //drawRectangles();

  textSetup();
  //String[] fontList = PFont.list();
  //printArray(fontList);
}

// ----------------------------------------------------------------------
// DRAW
// ----------------------------------------------------------------------


void draw() {
    println(frameRate);

  tint(255, 128);
  image(img, width/2, height/2, width, height);

  drawText();

  // Draws screen to LED display mapping for reference
  //for (int j = 0; j < bectonScreens.size(); j++) {
  //  bectonScreens.get(j).draw();
  //}

  //if (!justAdded) {
  //ps.addParticle();
  //  justAdded = true;
  //}
  //else justAdded = false;

  //ps.run();
  drawSmoke();
}

// ----------------------------------------------------------------------
// CLASSES
// ----------------------------------------------------------------------

class Rectangle {
  float x1, x2, y1, y2, w, h;

  Rectangle(float[] upperLeft, float[] bottomRight) {
    x1 = upperLeft[0];
    y1 = upperLeft[1];
    x2 = bottomRight[0];
    y2 = bottomRight[1];

    w = x2 - x1;
    h = y2 - y1;
  }

  void draw() {
    fill(255);
    stroke(0);
    rect(x1, y1, x2 - x1, y2 - y1);

    fill(0);
    text(Math.abs(w) + " x " + Math.abs(h), x1 + w / 2 - 40, y1 + h / 2);
  }
}
