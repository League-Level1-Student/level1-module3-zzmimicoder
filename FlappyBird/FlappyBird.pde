float BirdY = 375;
float BirdYVelocity = 0;
float PipeX = 500;
float UpperPipeHeight = 400;
float LowerPipeHeight = 1;
float PipeGap = 50;
int Score = 0;
boolean GameActive = true;
boolean ScoreCanIncrement = true;
PImage BirdImage;
PImage BackgroundImage;
PImage TopPipeImage;
PImage BottomPipeImage;
void setup() {
  BirdImage = loadImage("Bird.png");
  BackgroundImage = loadImage("Background.jpg");
  TopPipeImage = loadImage("TopPipe.png");
  BottomPipeImage = loadImage("BottomPipe.png");
  size(500, 750);
  BirdImage.resize(40, 40);
  PipeX = 500;
  UpperPipeHeight = random(100, 400);
  PipeGap = random(160, 200);
  LowerPipeHeight = 750 - (UpperPipeHeight + PipeGap);
  ScoreCanIncrement = true;
  TopPipeImage.resize(20, int(UpperPipeHeight));
  BottomPipeImage.resize(20, int(LowerPipeHeight));
}
void draw() {
  if (GameActive) {
    Update();
  }
}
void Update() {
  background(BackgroundImage);
  BirdYVelocity += 0.1;
  BirdY += BirdYVelocity;
  PipeX -= 3;
  if (PipeX < 0) {
    PipeX = 500;
    UpperPipeHeight = random(100, 400);
    PipeGap = random(160, 200);
    LowerPipeHeight = 750 - (UpperPipeHeight + PipeGap);
    ScoreCanIncrement = true;
    TopPipeImage.resize(20, int(UpperPipeHeight));
    BottomPipeImage.resize(20, int(LowerPipeHeight));
  }
  if (mousePressed) {
    BirdYVelocity -= 0.2;
  }
  if ((BirdY < UpperPipeHeight && 250 > PipeX && 250 < (PipeX + 20)) || (BirdY > 750 - LowerPipeHeight && 250 > PipeX && 250 < (PipeX + 20))) {
    GameActive = false;
  }
  if (250 > PipeX && ScoreCanIncrement) {
    Score++;
    ScoreCanIncrement = false;
  }
  image(BirdImage, 230, BirdY - 20);
  image(TopPipeImage, PipeX - 10, 0);
  image(BottomPipeImage, PipeX - 10, 750 - BottomPipeImage.height);
  fill(0, 255, 0);
  stroke(0, 255, 0);
//  rect(PipeX - 10, 0, 20, UpperPipeHeight);
//  rect(PipeX - 10, 750 - LowerPipeHeight, 20, LowerPipeHeight);
  text("Score: " + Score, 10, 30);
}
