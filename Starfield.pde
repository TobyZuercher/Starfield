class Particle
{
  float x, y, size, angle, speed, timeAlive, col, sat, bri;
  Particle()
  {
    x = mouseX;
    y = mouseY;
    size = 10;
    speed = (float)(Math.random() * 10);
    timeAlive = 0;
    col = (float)(Math.random() * 60 + 240);
    sat = (float)(Math.random() * 50 + 50);
    bri = (float)(Math.random() * 50 + 50);
  }
  
  void move()
  {
    x += speed * cos(angle);
    y += speed * sin(angle);
    angle += radians(4);
    timeAlive++;
  }
  
  void show()
  {
    fill(col, sat, bri);
    ellipse(x, y, size, size);
  }
}

class Exploder extends Particle
{
  Exploder()
  {
    x = mouseX;
    y = mouseY;
    size = 10;
    speed = (float)(Math.random() * 10 + 5);
    timeAlive = 0;
    col = 0;
    sat = 100;
    bri = (float)(Math.random() * 100);
  }
  
  void move()
  {
    x += speed * cos(angle);
    y += speed * sin(angle);
    timeAlive++;
  }
}

Particle[][] guys = new Particle[20][50]; //do tha 2d array
int x = 0;
void setup()
{
  size(800, 800);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw()
{
  //background(100);
  fill(0, 0, 5, 40);
  rect(0, 0, 800, 800);
  for(int j = 0; j < guys.length; j++)
  {
      for(int i = 0; i < guys[0].length && guys[j][0] != null; i++)
      {
        guys[j][i].move();
        guys[j][i].show();
        if(guys[j][0].timeAlive >= 90)
          guys[j][0] = null;
      }
  }
}

void mousePressed()
{
  int pType = (int)(Math.random()*2);
  boolean b = false;
  for(int j = 0; j < guys.length && b == false; j++)
  {
    if(guys[j][0] == null)
    {
      for(int i = 0; i < guys[0].length; i++)
      {
        if(pType == 0)
          guys[j][i] = new Particle();
        if(pType == 1)
          guys[j][i] = new Exploder();
        guys[j][i].angle = i * radians(360/guys[j].length);
      }
      b = true;
    }
  }
}

//randomized animations -> how many more??
