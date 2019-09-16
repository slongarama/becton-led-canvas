// References: https://www.openprocessing.org/sketch/711218
// ---------------------------------------------------------

int np = 300;
float startcol = random(255);
int frame = 0;
int frameBound_low = 0;
int frameBound_high = 200;
float direction = 1;

void drawSmoke () {
  beginShape();
  float deltaX = 0;
  float deltaY = 0;

  for (int i = 0; i < np; i++) {
    float angle = map(i, 0, np, 0, TWO_PI);
    deltaX = 3 * width / 4 + 150 * sin(frame / 50);
    deltaY = frame * 5 - 200;
    //deltaX = frame * 5 - 200;
    //deltaY = height / 2 + 150 * sin(frame / 50);
    float xx = 100 * cos(angle + deltaX / 10);
    float yy = 100 * sin(angle + deltaX / 10);
    PVector v = new PVector(xx, yy);
    xx = (xx + deltaX) / 150; 
    yy = (yy + deltaY) / 150;
    v.mult(1 + 1.5 * noise(xx, yy));
    vertex(deltaX + v.x, deltaY + v.y);
  }
  
  frame += direction;
  if (frame > frameBound_high || frame < frameBound_low) direction *= -1;
  
  colorMode(HSB, 100);
  float hue = deltaX / 8 - startcol;
  if (hue < 0) hue += 255;
  strokeWeight(1);
  stroke(hue, 50, 100);
  fill(255, 100);
  endShape();
}
