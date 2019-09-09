PImage img, img2, img3, img4;
int width = 736;
int height = 907;
boolean clicked = false;

void setup() {
  size(736, 907);
  imageMode(CENTER);

  img = loadImage("images/eyes.jpg");
  img2 = loadImage("images/eyes2.jpg");
  img3 = loadImage("images/ooze.jpg");
  img4 = loadImage("images/bikinibottom.jpg");
  img2.resize(width, height);
  img3.resize(width, height);
  img4.resize(width, height);
  img2.mask(img3);
  img3.mask(img4);
}

void draw() {
  background(img2);
  if (clicked) {
    translate(width/2, height/2);
    rotate(radians(180));
    translate(-img.width/2, -img.height/2);
  }
  tint(255,100,0,100);
  image(img, width/2, height/2);
  tint(210,10);
  image(img3, width/2, height/2);
}

void mousePressed() {
  if (clicked) {
    clicked = false;
  }
  else clicked = true;
}
