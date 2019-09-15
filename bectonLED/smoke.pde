// References open proceessing sketch: https://www.openprocessing.org/sketch/711218
int np = 300;
float startcol = random(255);

void drawSmoke () {
  beginShape();
  float sx = 0, sy = 0;
  float cx = 0;
  float cy = 0;

  for (int i = 0; i < np; i++) {
    float angle = map(i, 0, np, 0, TWO_PI);
    cx = frameCount * 2 - 200;
    cy = height / 2 + 50 * sin(frameCount / 50);
    float xx = 100 * cos(angle + cx / 10);
    float yy = 100 * sin(angle + cx / 10);
    PVector v = new PVector(xx, yy);
    xx = (xx + cx) / 150; 
    yy = (yy + cy) / 150;
    v.mult(1 + 1.5 * noise(xx, yy));
    vertex(cx + v.x, cy + v.y);
    if (i == 0) {
      sx = cx + v.x;
      sy = cy + v.y;
    }
  }
  
  float hue = cx / 2 - startcol;
  if (hue < 0) hue += 255;
  stroke(hue, 100, 120);
  fill(hue + 20);
  //noFill();
  strokeWeight(10);
  vertex(sx, sy);

  endShape();
}
