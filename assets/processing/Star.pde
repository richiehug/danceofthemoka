class Star extends Scene {

  color octagonCol = color(255, 0, 0);
  color starCol = color(0, 0, 0);

  void loop(PGraphics target) {

    if (frameCount % 100 >= 90 || frameCount % 85 == 0) {
      starCol = color(random(200,255));
    }

    gradient(target);
    target.noStroke();
    target.fill(starCol);

    for (int i = 0; i<8; i++) {
      target.pushMatrix();
      target.translate(MATRIX_WIDTH/2, MATRIX_HEIGHT/2);
      target.rotate(TAU/8*i);
      target.rect(-2, 0, 4, MATRIX_HEIGHT*2*(sin(frameCount*0.04)*0.5));
      target.popMatrix();
    }

    octagon(target, octagonCol, 7);
  }
}
