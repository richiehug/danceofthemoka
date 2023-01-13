class OctagonExplosion extends Scene {

  color octagonCol = color(255);

  void loop(PGraphics target) {
    float x = sin(frameCount * 0.009 + 1) * 10 + 0.5 * 0.5;

    pushMatrix();
    target.noFill();
    for (int i=0; i<9; i++) {
      target.stroke(255, 0, 0);
      target.strokeWeight(3);
      polygon(target, MATRIX_WIDTH/2, MATRIX_HEIGHT/2, x*i*0.6+1, 8);
      target.stroke(255);
      target.strokeWeight(1);
      polygon(target, MATRIX_WIDTH/2, MATRIX_HEIGHT/2, x*i*0.6+1, 8);
    }
    popMatrix();
    octagon(target, octagonCol, 7);
  }
}
