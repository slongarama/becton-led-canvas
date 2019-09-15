PFont f;
String[] book, yuebing;
String bookstring, longSubstring;
int numStrings = 7;

void textSetup() {
  yuebing = loadStrings("media/yuebing.txt");
  book = loadStrings("media/chinese.txt");
  bookstring = join(book, "");

  longSubstring = bookstring.substring(800, 1100);
  f = createFont("Yuppy SC", 36, true);
  textFont(f, 36);
}

void drawText() {
  fill(#FD0000);
  int x1 = 10;

  for (int i = 0; i < yuebing.length; i++) {
    for (int j = 0; j < yuebing[i].length(); j++) {
      textSize(random(50, 90));
      text(yuebing[i].charAt(j), x1, 3*height/4);
      //textWidth() spaces the characters out properly.
      x1 += textWidth(yuebing[i].charAt(j));
    }
  }

  fill(0);
  textSize(36);
  float x = 30;
  float y = height;
  pushMatrix();
  translate(x, y);
  rotate(-HALF_PI);
  text(longSubstring, 0, .7*height, width, height);
  popMatrix();
}
