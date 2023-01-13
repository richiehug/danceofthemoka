/**
 * This sketch sends all the pixels of the canvas to the serial port.
 * A helper function to scan all the serial ports for a configured controller is provided.
 */

import processing.serial.*;

final int MATRIX_WIDTH  = 32;
final int MATRIX_HEIGHT = 32;
final int NUM_CHANNELS  = 3;

Serial serial;
byte[]buffer;

int graphicSize = 600;
boolean debug = false;
int sceneLength = 600;
int step = 1, rotation = 0;
float x, y, z;
boolean countGoingUp = true;

PGraphics led;

Scene[] scenes;
int currentScene = 0;

void setup() {

  size(600, 600);
  noSmooth();
  led = createGraphics(MATRIX_WIDTH, MATRIX_HEIGHT);
  led.smooth(8);

  //printArray(Serial.list());

  try {
    serial = new Serial(this, "/dev/cu.usbmodem128291301");
  }
  catch(Exception e) {
    println("Couldn't open the serial port...");
    println(e);
  }

  buffer = new byte[MATRIX_WIDTH * MATRIX_HEIGHT * NUM_CHANNELS];

  scenes = new Scene[11];
  scenes[0] = new Fireworks();
  scenes[1] = new Cross();
  scenes[2] = new Bialetti();
  scenes[3] = new BialettiMoustache();
  scenes[4] = new OctagonExplosion();
  scenes[5] = new TwoRotating();
  scenes[6] = new Spiral();
  scenes[7] = new Star();
  scenes[8] = new Tentacles();
  scenes[9] = new RotatingOcts();
  scenes[10] = new CoffeeImage();
}

void draw() {
  Scene scene = scenes[currentScene];
  led.beginDraw();
  led.background(0);
  led.noStroke();
  led.fill(255);
  scene.loop(led);
  led.endDraw();

  if (debug) {
    currentScene = 0;
  } else {
    if (frameCount % sceneLength == 0) {
      currentScene = (currentScene+1) % scenes.length;
    }
  }

  image(led, 0, 0, graphicSize, graphicSize);

  // Write to the serial port (if open)

  if (serial != null) {
    led.loadPixels();
    int idx = 0;
    for (int i=0; i<led.pixels.length; i++) {
      color c = led.pixels[i];
      buffer[idx++] = (byte)(c >> 16 & 0xFF); // r
      buffer[idx++] = (byte)(c >> 8  & 0xFF); // g
      buffer[idx++] = (byte)(c       & 0xFF); // b
    }
    serial.write('*');     // The 'data' command
    serial.write(buffer);  // ...and the pixel values
  }
}

void keyPressed() {
  if (key == 's') {
    String file = System.currentTimeMillis() + ".png";
    println("Saving file: " + file);
    led.save("out/" + file);
  }
}

float smoothUnion( float d1, float d2, float k ) {
  float h = constrain(0.5 + 0.5 * (d2 - d1) / k, 0.0, 1.0 );
  return lerp( d2, d1, h ) - k * h * (1.0 - h);
}

void polygon(PGraphics canvas, float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  canvas.beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a + TAU / npoints * 0.5) * radius;
    float sy = y + sin(a + TAU / npoints * 0.5) * radius;
    canvas.vertex(sx, sy);
  }
  canvas.endShape(CLOSE);
}

void octagon(PGraphics target, color col, float polygonSize) {
  target.pushMatrix();
  target.translate(MATRIX_WIDTH/2, MATRIX_HEIGHT/2);
  target.stroke(col);
  target.fill(col);
  polygon(target, 0, 0, max(polygonSize*(sin(frameCount * 0.05)*0.59+0.5), polygonSize), 8);
  target.popMatrix();
}

void gradient(PGraphics target) {
  float c1x = sin(frameCount * 0.02) * 0.7;
  float c1y = cos(frameCount * 0.03) * 0.7;
  float c1z = sin(frameCount * 0.06) * 0.7;

  target.loadPixels();
  for (int j=0; j<MATRIX_HEIGHT; j++) {
    for (int i=0; i<MATRIX_WIDTH; i++) {

      float a = 1.0 * i / MATRIX_WIDTH - 1.0;
      float b = 1.0 * j / MATRIX_HEIGHT - 1.0;
      float c = 1.0 * j / MATRIX_WIDTH - 1.0;

      float r = (a * c1x) * 5;
      float g = (b * c1y) * 5;
      float d = (c * c1z) * 5;

      target.pixels[i + j * MATRIX_WIDTH] = color(r * 255, g * 255, d * 255);
    }
  }
  target.updatePixels();
}
