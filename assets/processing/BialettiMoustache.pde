class BialettiMoustache extends Scene {

  PImage bialettiMoustache;
  int textWidth = 80;
  int textHeight = 30;
  color octagonCol = color(255, 0, 0);

  BialettiMoustache() {
    bialettiMoustache = loadImage("bialettiMoustache.png");
    bialettiMoustache.resize(40, 40);
  }

  void loop(PGraphics target) {
    float x = sin(frameCount * 0.009 + 1) * 10 + 0.5 * 0.5;
    float z = sin(frameCount * 0.007 + 30) * 5;

    gradient(target);
    target.image(bialettiMoustache, MATRIX_WIDTH*x/3, 0);
    target.image(bialettiMoustache, -MATRIX_WIDTH*x/3, 0);
    octagon(target, octagonCol, 7);
  }
}
