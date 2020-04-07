int FrogX = 500;
int FrogY = 450;
int MoveTime = 10;
int Score = 0;
boolean FastMove = false;
import javax.swing.JOptionPane;
Car Car1 = new Car(1000, 200, 25, 10);
Car Car2 = new Car(1000, 400, 25, 10);
class Car {
  int X;
  int Y;
  int Size;
  int Speed;
  Car(int XPos, int YPos, int CarSize, int CarSpeed) {
    this.X = XPos;
    this.Y = YPos;
    this.Size = CarSize;
    this.Speed = CarSpeed;
  }
  void Display() {
    fill(255, 0, 0);
    rect(X, Y, Size * 1.5, Size);
  }
  void Move(String LeftOrRight) {
    if (LeftOrRight == "Left") {
      X -= Speed;
    } else if (LeftOrRight == "Right") {
      X += Speed;
    }
    if (X <= 0) {
      X = 1000;
    } else if (X >= 1000) {
      X = 0;
    }
  }
  int GetX() {
    return X;
  }
  int GetY() {
    return Y;
  }
  int GetSize() {
    return Size;
  }
  void Faster() {
    Speed += 1;
  }
}
void setup() {
  size(1000, 500);

}
void draw() {
  background(0, 0, 255);
  fill(0, 255, 0);
  ellipse(FrogX, FrogY, 25, 25);
  if (keyPressed) {
    if (key == CODED && MoveTime <= 0) {
      if (keyCode == UP) {
        FrogY -= 10;
      } else if (keyCode == DOWN) {
        FrogY += 10;
      } else if (keyCode == LEFT) {
        FrogX -= 10;
      } else if (keyCode == RIGHT) {
        FrogX += 10;
      }
      MoveTime = 10;
    } else if (key == 'q' || key == 'Q') {
      exit();
    } else if (key == 'm' || key == 'M') {
      if (!FastMove) {
        println("FastMove is on");
        FastMove = true;
      }
    }
  }
  if (FrogX >= 1000) {
    FrogX = 995;
  } else if (FrogY >= 500) {
    FrogY = 495;
  } else if (FrogX <= 0) {
    FrogX = 5;
  } else if (FrogY <= 0) {
    FrogY = 450;
    Score += 1;
    Car1.Faster();
    Car2.Faster();
  }
  MoveTime -= (round(Score / 2) + 1);
  if (FastMove) {
    MoveTime = 0;
  }
  Car1.Move("Right");
  Car2.Move("Left");
  Car1.Display();
  Car2.Display();
  if (Intersects(Car1) || Intersects(Car2)) {
      JOptionPane.showMessageDialog(null, "You Died     Score: " + Score);
      exit();
  }
  text("Score: " + Score, 20, 20);
}
boolean Intersects(Car TheCar) {
  if ((FrogY > TheCar.GetY() && FrogY < TheCar.GetY() + TheCar.GetSize()) && (FrogX > TheCar.GetX() && FrogX < TheCar.GetX() + TheCar.GetSize() * 1.5)) {
     return true;
  }
  else  {
    return false;
  }
}
