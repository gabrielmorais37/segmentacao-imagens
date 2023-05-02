PImage img1, img2, imgResult;
int w, h;

void setup() {
  size(640, 471);
  img1 = loadImage("faltante.jpg");
  img2 = loadImage("gtGerada.jpg");
  w = img1.width;
  h = img1.height;
  imgResult = createImage(w, h, RGB);
  mergeImages();
}

void mergeImages() {
  img1.loadPixels();
  img2.loadPixels();
  imgResult.loadPixels();
  
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      int index = i + j * w;
      int pixel1 = img1.pixels[index];
      int pixel2 = img2.pixels[index];
      
      int red1 = (pixel1 >> 16) & 0xFF;
      int green1 = (pixel1 >> 8) & 0xFF;
      int blue1 = pixel1 & 0xFF;
      
      int red2 = (pixel2 >> 16) & 0xFF;
      int green2 = (pixel2 >> 8) & 0xFF;
      int blue2 = pixel2 & 0xFF;
      
      int red = (red1 + red2) / 2;
      int green = (green1 + green2) / 2;
      int blue = (blue1 + blue2) / 2;
      
      int mergedPixel = color(red, green, blue);
      imgResult.pixels[index] = mergedPixel;
    }
  }
  
  imgResult.updatePixels();
}

void draw() {
  background(255);
  image(imgResult, 0, 0);
  save("completo.jpg");
}
