class Bialetti extends Scene {

  PImage bialettiIcon, bialettiText;
  int textWidth = 80;
  int textHeight = 30;
  color octagonCol = color(255,0,0);

  Bialetti() {
    bialettiIcon = loadImage("bialettiIcon.png");
    bialettiText = loadImage("bialettiText.png");
    bialettiIcon.resize(ceil(MATRIX_WIDTH*1.5), ceil(MATRIX_HEIGHT*1.5));
    bialettiText.resize(textWidth, textHeight);
  }

  void loop(PGraphics target) {
    float x = sin(frameCount * 0.009 + 1) * 10 + 0.5 * 0.5;
    float z = sin(frameCount * 0.007 + 30) * 5;
    
    gradient(target);

    target.image(bialettiIcon, 0, -MATRIX_HEIGHT*2*x/10);
    target.pushMatrix();
    target.translate(-MATRIX_WIDTH*0.7, -MATRIX_HEIGHT*0.7);
    target.image(bialettiIcon, 0, MATRIX_HEIGHT*2*x/10);
    target.popMatrix();

    target.pushMatrix();
    target.translate(MATRIX_WIDTH - MATRIX_WIDTH*z*0.9, MATRIX_HEIGHT/32);
    target.fill(0);
    target.rect(0, 0, textWidth, textHeight);
    target.image(bialettiText, 0, 0);
    target.popMatrix();

    octagon(target, octagonCol, 7);
  }
}
