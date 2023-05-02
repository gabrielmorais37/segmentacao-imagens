void setup() {
  size(640,545);
  noLoop();
}

void draw() {
   PImage img = loadImage("original.jpg"); 
   PImage img2 = createImage(img.width, img.height, RGB);
    
   for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         int media = (int) (red(img.pixels[pos]) + 
                            green(img.pixels[pos]) + 
                            blue(img.pixels[pos])) / 3;
         img2.pixels[pos] = color(red(img.pixels[pos]));
       
     }
   }  
   
   for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         int brilho = (int) red(img2.pixels[pos]) + 80;
         if (brilho > 255) brilho = 0;
         else if(brilho < 0) brilho = 255;
         img2.pixels[pos] = color(brilho);
     }
   }   
   for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         if(red(img2.pixels[pos]) > 0 &&
            y > 0 &&
            y < 520 &&
            x > 288 &&
            x < 490) 
           img2.pixels[pos] = color(255);
         else 
           img2.pixels[pos] = color(0);           
     }
   }
  
   image(img2,0,0);
   save("gtGerada.jpg");
}
