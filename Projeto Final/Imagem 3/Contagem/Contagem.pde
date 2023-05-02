
PImage img1, img2; // Declaração das variáveis para armazenar as imagens

void setup() {
  size(900, 400); // Define o tamanho da janela
  img1 = loadImage("original.png"); // Carrega a primeira imagem
  img2 = loadImage("gtGerada.jpg"); // Carrega a segunda imagem
  img1.resize(width/2, height); // Redimensiona a primeira imagem para a metade da largura da janela
  img2.resize(width/2, height); // Redimensiona a segunda imagem para a metade da largura da janela
}

void draw() {
  background(0); // Define o fundo da janela como branco
  image(img1, 0, 0); // Exibe a primeira imagem na janela
  image(img2, width/2, 0); // Exibe a segunda imagem na janela, ao lado da primeira
  
  int whitePixelsImg1 = countWhitePixels(img1); // Conta a quantidade de pixels brancos na primeira imagem
  int whitePixelsImg2 = countWhitePixels(img2); // Conta a quantidade de pixels brancos na segunda imagem
  
  fill(255,0,0); // Define a cor do texto como preto
  textSize(20); // Define o tamanho do texto como 20
  textAlign(CENTER); // Alinha o texto ao centro da janela
  text("Imagem 1: " + whitePixelsImg1 + " pixels brancos", width/4, height-50); // Exibe o número de pixels brancos na primeira imagem
  text("Imagem 2: " + whitePixelsImg2 + " pixels brancos  " + "\n" +"% em relação ao GT da original: "+ (whitePixelsImg2*100)/whitePixelsImg1 + "%" , width*3/4, height-50); // Exibe o número de pixels brancos na segunda imagem
}

int countWhitePixels(PImage img) {
  int whitePixels = 0; // Inicializa a variável que vai armazenar o número de pixels brancos
  
  img.loadPixels(); // Carrega os pixels da imagem para um array
  
  for (int i = 0; i < img.pixels.length; i++) {
    if (brightness(img.pixels[i]) == 255) { // Se o pixel for branco (brilho máximo)
      whitePixels++; // Incrementa o contador de pixels brancos
    }
  }
  
  img.updatePixels(); // Atualiza a imagem com as modificações no array de pixels
  
  return whitePixels; // Retorna o número de pixels brancos
}
