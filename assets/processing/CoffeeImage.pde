class CoffeeImage extends Scene {

  color octagonCol = color(255);
  PImage coffee;

  CoffeeImage() {
    coffee = loadImage("coffee.png");
  }

  void loop(PGraphics target) {
    float x = sin(frameCount * 0.01) * 0.5 + 0.5;
    led.pushMatrix();
    led.translate(-12, 0);
    led.scale(1+x/6);
    led.image(coffee, 0, 0);
    led.popMatrix();

    octagon(target, octagonCol, 7);
  }
}
