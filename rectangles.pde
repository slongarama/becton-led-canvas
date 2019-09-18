// References: https://github.com/slongarama/cpsc334-generative-art
// --------------------------------------------------------------------
ArrayList<Rectangle> bectonScreens = new ArrayList<Rectangle>();
String[] rectangles;

class Rectangle {
  float x1, x2, y1, y2;

  Rectangle(float[] upperLeft, float[] bottomRight) {
    x1 = upperLeft[0];
    y1 = upperLeft[1];
    x2 = bottomRight[0];
    y2 = bottomRight[1];
  }
}

void loadRectangles () {
  float[] rectUpperLeft = { 0, 0 };
  float[] rectBottomRight = { 0, 0 };
  
  rectangles = loadStrings("data/rectangles.txt");
  for (int j = 0; j < rectangles.length; j++) {
    String[] coords = rectangles[j].split(", ", 4);

    rectUpperLeft[0] = parseInt(coords[0]);
    rectUpperLeft[1] = parseInt(coords[2]);
    rectBottomRight[0] = parseInt(coords[1]);
    rectBottomRight[1] = parseInt(coords[3]);

    bectonScreens.add(new Rectangle(rectUpperLeft, rectBottomRight));
  }
}
