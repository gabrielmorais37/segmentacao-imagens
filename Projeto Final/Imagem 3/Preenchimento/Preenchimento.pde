PImage originalImg;
PImage groundTruthImg;

void setup() {
  size(640, 406);
  
  // Carrega as imagens
  originalImg = loadImage("original.jpg");
  groundTruthImg = loadImage("gtGerada.jpg");
  
  // Define o tamanho da imagem ground truth
  groundTruthImg.resize(originalImg.width, originalImg.height);
}

void draw() {
  // Carrega os pixels da imagem ground truth
  groundTruthImg.loadPixels();
  
  // Percorre todos os pixels da imagem ground truth
  for (int x = 0; x < groundTruthImg.width; x++) {
    for (int y = 0; y < groundTruthImg.height; y++) {
      // Verifica se o pixel na imagem ground truth é branco
      int index = x + y * groundTruthImg.width;
      color groundTruthColor = groundTruthImg.pixels[index];
      if (brightness(groundTruthColor) == 255) {
        // Encontra a cor correspondente na imagem original
        color originalColor = originalImg.get(x, y);
      
        // Define a cor do pixel na imagem ground truth como a cor correspondente na imagem original
        groundTruthImg.set(x, y, originalColor);
      }
    }
  }
  
  // Atualiza os pixels da imagem ground truth
  groundTruthImg.updatePixels();
  
  // Exibe a imagem ground truth
  image(groundTruthImg, 0, 0);
  
  // Salva a imagem ground truth
  save("ground_truth_preenchido.png");
}
