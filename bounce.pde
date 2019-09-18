// References: https://processing.org/examples/simpleparticlesystem.html
// --------------------------------------------------------------------
// A class to describe a group of Particles

ParticleSystem ps = new ParticleSystem(new PVector(width-width/5, 50));
float diameter = 2*height;
PVector startpos;

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticles() {
    for (int i = 0; i < bectonScreens.size(); i++) {
      Rectangle rect = bectonScreens.get(i);
      startpos = new PVector((rect.x1 + rect.x2)/2, (rect.y1 + rect.y2)/2);
      //startpos = new PVector(rect.x2, rect.y2);
      particles.add(new Particle(startpos));
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
    }
  }
}

class Particle {
  PVector position;
  float opacity;
  float increment = 1;
  float saturation;
  float angle = random(TWO_PI);

  Particle(PVector l) {
    position = l.copy();
    opacity = 255.0;
    saturation = (float) Math.random() * 55 + 45;
  }

  void run() {
    display();
  }

  // Method to display
  void display() {
    float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;

    colorMode(HSB, 100);
    strokeWeight(0);
    stroke(10, saturation, 100, opacity);
    fill(10, saturation, 100, opacity);
    ellipse(position.x, position.y, d1, d1);

    angle += .07;

    opacity -= increment;
    if (opacity < 0.0) increment*=-1;
    else if (opacity > 255.0) increment*=-1;
  }
}
