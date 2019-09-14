// References:
    // CPSC 334 Task 1 group portion, see https://github.com/slongarama/cpsc334-generative-art
    // Particle class: https://processing.org/examples/simpleparticlesystem.html
ParticleSystem ps;

ArrayList<Rectangle> bectonScreens = new ArrayList<Rectangle>();

String[] lines;

boolean state = false;
float[] rectUpperLeft = { 0, 0 };
float[] rectBottomRight = { 0, 0 };

void setup() {
  fullScreen();
  lines = loadStrings("screenPositions.txt");
  
  for (int j = 0; j < lines.length; j++) {
    String[] coords = lines[j].split(", ", 4);

    rectUpperLeft[0] = parseInt(coords[0]);
    rectUpperLeft[1] = parseInt(coords[2]);
    rectBottomRight[0] = parseInt(coords[1]);
    rectBottomRight[1] = parseInt(coords[3]);

    bectonScreens.add(new Rectangle(rectUpperLeft, rectBottomRight));
  }
 
  ps = new ParticleSystem(new PVector(width/2, 50));
}

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

// Processing example: https://processing.org/examples/simpleparticlesystem.html
// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

void draw() {
  background(#571845);
  
  // For my reference, so I know where the small panels are
  for (int j = 0; j < bectonScreens.size(); j++) {
    bectonScreens.get(j).draw();
  }
  ps.addParticle();
  ps.run();
}
