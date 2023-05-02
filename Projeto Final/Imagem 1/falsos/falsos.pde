PImage img1;
PImage img2;
int contador = 0;

void setup() {
  size(640, 471);
  background(0);
  
  // Carrega as imagens
  img1 = loadImage("original.png");//Ground truth original
  img2 = loadImage("gtGerada.jpg");//Ground truth gerado
  
  // Obtém as dimensões das imagens
  int largura = img1.width;
  int altura = img1.height;
  
  // Percorre todos os pixels da imagem 1
  for (int x = 0; x < largura; x++) {
    for (int y = 0; y < altura; y++) {
      
      // Obtém o pixel correspondente na imagem 2
      color corImg2 = img2.get(x, y);
      
      // Obtém o pixel na imagem 1
      color corImg1 = img1.get(x, y);
      
      // Compara os pixels
      if (corImg1 == color(255) && corImg2 != color(255)) {
        // Se o pixel na imagem 1 for branco e o pixel correspondente na imagem 2 for diferente de branco, pinta o pixel de vermelho e incrementa o contador
        stroke(255);
        point(x, y);
        contador++;
      }
    }
  }
  save("faltante.jpg");
  // Mostra o valor do contador na tela
  textSize(25);
  fill(255,0,0);
  text("Pixels pintados: " + contador, 10, 50);
}
