public class UpgradeImmunity extends Upgrades {

  //vars cost, size, radius, duration, posX, posY, angle need to be used
  public UpgradeImmunity() {
    cost = 700; 
    duration = 0; 
    angle = (int) random(0, 360);
    size = 40; 
    radius = 400; 
    if (random(100) >= 50 ) {
      radius -= size; 
      posX = width/2 + radius * cos(angle);
      posY = height/2 + radius * sin(angle);
    } else {
      posX = width/2 + radius * cos(angle);
      posY = height/2 + radius * sin(angle);
    }
  }

  public void drawUpgrades() { 
    fill(0, 0, 255);
    ellipse(posX, posY, size, size);
    textSize(23);
    //fills the negative color depending on whether its in the white bar or not
    fill(0, 255, 0); 
    noStroke(); 
    text("IM", posX - 7, posY + 10);
    fill(255); //resets fill color
  } 

  //draws the upgrade at an arbitrary location. Used for drawing the "next upgrade" in the game
  public void drawUpgrades(float x, float y) {
    fill(0, 0, 255);
    noStroke(); 
    ellipse(x, y, size, size);
    textSize(23);
    //fills the negative color depending on whether its in the white bar or not
    fill(0, 255, 0); 
    text("IM", x - 7, y + 10);
    fill(255); //resets fill color
  }

  public void useUpgrade() {
    player.setisDetecting(false);
    duration += (float)1/frameRate; //equates to adding 1 per second
  }

  public boolean stillWorking() {
    if (duration <= 4)
      return true;
    else {
      player.setisDetecting(true); //resets frameRate back to original
      return false;
    }
  }
}