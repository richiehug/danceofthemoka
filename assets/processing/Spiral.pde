class Spiral extends Scene {

  color octagonCol = color(255, 0, 0);

  void loop(PGraphics target) {
    float x = sin(frameCount*0.04)*0.5;

    target.pushMatrix();
    target.translate(MATRIX_WIDTH/2, MATRIX_HEIGHT/2);
    for (int i = 0; i<8; i++) {
      target.pushMatrix();
      target.rotate(TAU/8*i);
      target.rect(-MATRIX_WIDTH/32, 0, MATRIX_WIDTH*x-MATRIX_WIDTH/32, MATRIX_HEIGHT);
      target.popMatrix();
    }
    target.popMatrix();
    octagon(target, octagonCol, 7);
  }
}
