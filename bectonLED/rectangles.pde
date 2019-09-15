void drawRectangles () {
  rectangles = loadStrings("screenPositions.txt");
  for (int j = 0; j < rectangles.length; j++) {
    String[] coords = rectangles[j].split(", ", 4);

    rectUpperLeft[0] = parseInt(coords[0]);
    rectUpperLeft[1] = parseInt(coords[2]);
    rectBottomRight[0] = parseInt(coords[1]);
    rectBottomRight[1] = parseInt(coords[3]);

    bectonScreens.add(new Rectangle(rectUpperLeft, rectBottomRight));
  }
}
