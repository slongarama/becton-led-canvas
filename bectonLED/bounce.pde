// Reference: https://processing.org/examples/simpleparticlesystem.html
// --------------------------------------------------------------------
// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

ParticleSystem ps = new ParticleSystem(new PVector(width-width/5, 50));
float diameter = height/10;

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();

    for (int i = 0; i < 20; i++) {
      particles.add(new Particle(origin));
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      //if (p.isDead()) {
      //  particles.remove(i);
      //}
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float r, g, b;
  float angle = random(TWO_PI);
  boolean reverse = false;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;

    r = (float) Math.random() * 255;
    g = (float) Math.random() * 255;
    b = (float) Math.random() * 255;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    if (reverse) {
      velocity.sub(acceleration);
      position.sub(velocity);
      if (position.y <= 0) reverse = false;
      print("going UP\n");
      print(position.y + "\n");
    } else {
      velocity.add(acceleration);
      position.add(velocity);
      if (position.y >= height) reverse = true;
      print("going down\n");
    }
    //lifespan -= 1.0;
  }

  // Method to display
  void display() {
    float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;

    stroke(r, g, b, lifespan);
    fill(r, g, b, lifespan);
    ellipse(position.x, position.y, d1, d1);

    angle += 0.08;
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
