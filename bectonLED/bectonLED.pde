// References:
// CPSC 334 Task 1 group portion, see https://github.com/slongarama/cpsc334-generative-art
// Particle class: https://processing.org/examples/simpleparticlesystem.html

// ----------------------------------------------------------------------
// SETUP
// ----------------------------------------------------------------------

ParticleSystem ps;

ArrayList<Rectangle> bectonScreens = new ArrayList<Rectangle>();
String[] lines;

PImage img;
float diameter;

boolean state = false;
float[] rectUpperLeft = { 0, 0 };
float[] rectBottomRight = { 0, 0 };


void setup() {
  fullScreen();

  // Load images
  imageMode(CENTER);
  img = loadImage("images/brush.jpg");

  // Particles
  diameter = height/10;
  ps = new ParticleSystem(new PVector(width-width/5, 50));

  // Draw rectangles
  lines = loadStrings("screenPositions.txt");
  for (int j = 0; j < lines.length; j++) {
    String[] coords = lines[j].split(", ", 4);

    rectUpperLeft[0] = parseInt(coords[0]);
    rectUpperLeft[1] = parseInt(coords[2]);
    rectBottomRight[0] = parseInt(coords[1]);
    rectBottomRight[1] = parseInt(coords[3]);

    bectonScreens.add(new Rectangle(rectUpperLeft, rectBottomRight));
  }
}

// ----------------------------------------------------------------------
// DRAW
// ----------------------------------------------------------------------


boolean justAdded = false;

void draw() {
  background(#FDBD82);
  image(img, width/2, height/2, width, height);

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
