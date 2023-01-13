class Tentacles extends Scene {

  color octagonCol = color(255, 0, 0);
  int tentacleWidth = MATRIX_WIDTH/8;
  int tentacles = MATRIX_WIDTH/4;

  void loop(PGraphics target) {
    float x = sin(frameCount * 0.009 + 1) * 10 + 0.25;

    gradient(target);

    target.pushMatrix();
    target.translate(MATRIX_WIDTH/2, MATRIX_HEIGHT/2);
    target.fill(255);
    for (int j=0; j<8; j++) {
      target.pushMatrix();
      target.rotate(TAU/tentacles * j);
      for (int i = 0; i<16; i++) {
        target.rect(0, -tentacleWidth*0.5-1, tentacleWidth*1.5, tentacleWidth);
        target.ellipse(0, 0, tentacleWidth, tentacleWidth);
        target.translate(tentacleWidth*1.5-1, 0);
        target.rotate(x);
        target.scale(0.9);
      }
      target.popMatrix();
    }
    target.popMatrix();

    octagon(target, octagonCol, 7);
  }
}
