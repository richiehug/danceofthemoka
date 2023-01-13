class Cross extends Scene {

  color octagonCol = color(255,0,0);

  void loop(PGraphics target) {
    float x = sin(frameCount* 0.17) * 1.2 + 0.5;
  
    target.pushMatrix();
    target.translate(MATRIX_HEIGHT/2, MATRIX_HEIGHT/2);
    for (int i=0; i<8; i++) {
      target.pushMatrix();
      octagon(led, color(255,0,0), x*8);
      octagon(led, color(255), x*2);
      target.popMatrix();
      target.rotate(TAU/8 * (i+1));
    }
    target.popMatrix();
    octagon(target, octagonCol, 7);
  }
}
