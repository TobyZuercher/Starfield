class Particle
{
  float x, y, size, angle, speed, timeAlive, col, sat, bri, maxTime;
  Particle()
  {
    x = mouseX;
    y = mouseY;
    size = 10;
    speed = (float)(Math.random() * 10 + 5);
    timeAlive = 0;
    col = 0;
    sat = (float)(Math.random() * 100);
    bri = 100;
    maxTime = 100;
  }
  
  void move()
  {
    x += speed * cos(angle);
    y += speed * sin(angle);
    timeAlive++;
  }
  
  void show()
  {
    fill(col, sat, bri);
    ellipse(x, y, size, size);
  }
}

class Swirler extends Particle
{
  Swirler()
  {
    x = mouseX;
    y = mouseY;
    size = 10;
    speed = (float)(Math.random() * 10);
    timeAlive = 0;
    col = (float)(Math.random() * 60 + 240);
    sat = (float)(Math.random() * 50 + 50);
    bri = (float)(Math.random() * 50 + 50);
    maxTime = 90;
  }
  
  void move()
  {
    x += speed * cos(angle);
    y += speed * sin(angle);
    angle += radians(4);
    timeAlive++;
  }
}

class Imploder extends Particle
{
  float initX, initY;
  Imploder(float xPos, float yPos)
  {
    initX = mouseX;
    initY = mouseY;
    x = xPos;
    y = yPos;
    size = 10;
    speed = (float)(Math.random() * 10 + 5);
    timeAlive = 0;
    col = 230;
    sat = 100;
    bri = (int)(Math.random() * 50 + 51);
    maxTime = 90;
  }
  
  void move()
  {
    if(timeAlive < 79)
    {
      x = initX + 100 * cos(angle);
      y = initY + 100 * sin(angle);
      angle += speed/100;
    }
    else
    {
      x -= 10 * cos(angle);
      y -= 10 * sin(angle);
    }
    timeAlive++;
  }
}

class Ringer extends Particle
{
  float initX, initY;
  Ringer()
  {
    x = mouseX;
    y = mouseY;
    size = 10;
    speed = (int)(Math.random() * 3) * 5 + 5;
    timeAlive = 0;
    col = 140;
    sat = 100;
    bri = (int)(Math.random() * 50 + 51);
    maxTime = 90;
  }
  
  void move()
  {
    x += speed * cos(angle);
    y += speed * sin(angle);
    timeAlive++;
  }
}

Particle[][] guys = new Particle[20][50];
int x = 0;
void setup()
{
  size(700, 700);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw()
{
  fill(0, 0, 5, 40);
  rect(0, 0, 800, 800);
  for(int j = 0; j < guys.length; j++)
  {
      for(int i = 0; i < guys[0].length && guys[j][0] != null; i++)
      {
        guys[j][i].move();
        guys[j][i].show();
        if(guys[j][0].timeAlive >= guys[j][0].maxTime)
          guys[j][0] = null;
      }
  }
}

void mousePressed()
{
  int pType = (int)(Math.random()*4);
  boolean b = false;
  for(int j = 0; j < guys.length && b == false; j++)
  {
    if(guys[j][0] == null)
    {
      for(int i = 0; i < guys[0].length; i++)
      {
        if(pType == 0)
        {
          guys[j][i] = new Particle();
          guys[j][i].angle = i * radians(360/guys[j].length);
        }
        if(pType == 1)
        {
          guys[j][i] = new Swirler();
          guys[j][i].angle = i * radians(360/guys[j].length);
        }
        if(pType == 2)
        {
          guys[j][i] = new Imploder(mouseX + 50*cos(i * radians(360/guys[j].length)), mouseY + 50*sin(i * radians(360/guys[j].length)));
          guys[j][i].angle = i * radians(360/guys[j].length);
        }
        if(pType == 3)
        {
          guys[j][i] = new Ringer();
          guys[j][i].angle = i * radians(360/guys[j].length);
        }
      }
      b = true;
    }
  }
}
