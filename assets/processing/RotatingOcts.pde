class RotatingOcts extends Scene {

  color octagonCol = color(255);
  int polygonSize = 7;

  void loop(PGraphics target) {
    float x = sin(frameCount * 0.009 + 1) * 10 + 0.5 * 0.5;

    target.noStroke();

    target.pushMatrix();
    target.translate(MATRIX_WIDTH/2, MATRIX_HEIGHT/2);
    target.rotate(TAU/36);

    target.pushMatrix();
    for (int j = 0; j<8; j++) {

      target.pushMatrix();
      target.rotate(TAU/16*j);
      target.fill(255, 0, 0);
      for (int i = 0; i<12; i++) {
        target.pushMatrix();
        target.translate(-1, i*x*1.2+1);
        polygon(target, i, i, polygonSize/2, 8);
        target.popMatrix();
      }
      target.popMatrix();

      target.pushMatrix();
      target.rotate((TAU/16)*j+TAU/2);
      target.fill(255, 100, 100);
      for (int i = 0; i<12; i++) {
        target.pushMatrix();
        target.translate(-1, i*x*1.2+1);
        polygon(target, i, i, polygonSize/2, 8);
        target.popMatrix();
      }
      target.popMatrix();
    }

    target.popMatrix();
    target.popMatrix();

    octagon(target, octagonCol, 7);
  }
}
