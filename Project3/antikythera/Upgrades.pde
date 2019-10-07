public abstract class Upgrades {  
  protected int cost, size, radius; 
  protected float duration, posX, posY; 
  protected int angle;  
    

  //draws the upgrade in the circle/map
  public abstract void drawUpgrades();
 
  //draws the upgrade at an arbitrary location. Used for drawing the "next upgrade" in the game
  public abstract void drawUpgrades(float x, float y); 
  
  //applies effect of upgrade on the game
  public abstract void useUpgrade();
 
  //checks if the upgrade is used up or not
  public abstract boolean stillWorking();
  
  public int getRadius() {
    return radius;  
  }
  
  public int getCost() {
   return cost; 
  }
}