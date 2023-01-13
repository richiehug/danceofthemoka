class Fireworks extends Scene {

  color octagonCol = color(255, 0, 0);

  void loop(PGraphics target) {

    gradient(target);
    target.pushMatrix();
    target.translate(MATRIX_WIDTH/2, MATRIX_HEIGHT/2);
    for (int i = 0; i < 8; i++) {
      target.rotate(TAU/8*i);
      target.pushMatrix();
      target.translate(0, step);
      target.rect(-1, -1, 3, 3);
      target.popMatrix();
    }
    target.popMatrix();
    octagon(target, octagonCol, 7);

    // steps 0 to 23
    if (frameCount % 5 == 0) {
      step += 1;
      if (step == 24) {
        step = 0;
      }
    }
  }
}
