class TwoRotating extends Scene {

  int polygonSize = 7;
  color octagonCol = color(255);

  void loop(PGraphics target) {
    float x = sin(frameCount * 0.009 + 1) * 10 + 0.5 * 0.5;

    if (frameCount % 100 <= 10 || frameCount % 17 <=3) {
      target.background(random(120, 150));
    }

    target.fill(255, 0, 0);

    target.pushMatrix();
    target.translate(MATRIX_WIDTH/2, MATRIX_HEIGHT/2);

    target.pushMatrix();
    target.rotate(radians(45.0)*rotation);
    polygon(target, 0, polygonSize*2, polygonSize, 8);
    target.popMatrix();

    target.pushMatrix();
    target.rotate(radians(45.0)*min(rotation, rotation-4));
    polygon(led, 0, polygonSize*2, polygonSize, 8);
    target.popMatrix();

    target.popMatrix();

    octagon(target, octagonCol, 7);

    // counter 8 to -8
    if (frameCount % 10 == 0 && countGoingUp) {
      rotation += 1;
    }

    if (frameCount % 10 == 0 && !countGoingUp) {
      rotation -= 1;
    }

    if (frameCount % 10 == 0 && (rotation == 8 || rotation == -8)) {
      countGoingUp = !countGoingUp;
    }
  }
}
