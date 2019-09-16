String[] book, yuebing;
String bookstring, longSubstring;
int maxSize = 50;
float textAngle = random(TWO_PI);

void textSetup() {
  yuebing = loadStrings("media/yuebing.txt");
  book = loadStrings("media/chinese.txt");
  bookstring = join(book, "");

  longSubstring = bookstring.substring(800, 1100);
  PFont f = createFont("Yuppy SC", 36, true);
  textFont(f, 36);
}

// --------------------------------------------------------------------
// DRAW MOVING TEXT
// --------------------------------------------------------------------
void drawMovingText() {
  fill(#FD0000); // red

  // Iterate through sentence stored in yuebing.txt and
  // place one character in each small rectangle
  for (int j = 0; j < yuebing[0].length(); j++) {
    float size = 30 + (sin(textAngle) * maxSize/2) + maxSize/2;
    textSize(size);

    // Display text in specific screen locations
    Rectangle rect = bectonScreens.get(j);
    text(yuebing[0].charAt(j), rect.x1, rect.y1);
  }

  textAngle += 0.05;
}

// --------------------------------------------------------------------
// DRAW BLOCK TEXT
// --------------------------------------------------------------------
void drawBlockText() {
  strokeWeight(13);
  fill(255); // color = white
  textSize(36); // adjust size

  // Rotate large block of text 
  // References: https://processing.org/discourse/beta/num_1219267259.html
  float x = 30;
  float y = height;
  pushMatrix();
  translate(x, y);
  rotate(-HALF_PI);
  //tint(255, 128);
  text(longSubstring, 0, .7 * height, width, height);
  popMatrix();
  //print("should have printed\n");
}
