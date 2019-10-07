public class UpgradeDoublePoints extends Upgrades {

  //vars cost, size, radius, duration, posX, posY, angle need to be used
  public UpgradeDoublePoints() {
    cost = 500; 
    duration = 0; 
    angle = (int) random(0, 360);
    size = 40; 
    radius = 400; 
    if (random(100) > 50 ) {
      radius -= size; 
      posX = width/2 + radius * cos(angle);
      posY = height/2 + radius * sin(angle);
    } else {
      posX = width/2 + radius * cos(angle);
      posY = height/2 + radius * sin(angle);
    }
  }

  //public UpgradeDoublePoints(int inputCost, int inputDuration, int inputSize) {
  //  cost = inputCost;
  //  duration  = inputDuration;
  //  size = inputSize;
  //}

  public void drawUpgrades() {
    fill(143, 120, 100); 
    noStroke(); 
    ellipse(posX, posY, size, size);
    textSize(22);
    fill(10, 255, 10); 
    text("2X", posX - 7, posY + 10);
    fill(255); //resets fill color
  }

  //draws the upgrade at an arbitrary location. Used for drawing the "next upgrade" in the game
  public void drawUpgrades(float x, float y) {
    fill(143, 120, 100); 
    ellipse(x, y, size, size);
    noStroke(); 
    textSize(22);
    fill(10, 255, 10); 
    text("2X", x - 7, y + 10);
    fill(255); //resets the fill color
  }

  public void useUpgrade() {
    currentScore += 1;
    duration += (float)1/frameRate; //equates to adding 1 per second
  }

  public boolean stillWorking() {
    if (duration <= 5)
      return true;
    else 
    return false;
  }
}