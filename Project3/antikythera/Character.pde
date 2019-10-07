class Character {

  protected float posX, posY, radius;
  protected int size;
  protected int angle; //angle measure
  protected boolean out;   
  protected color myColor; 

  //default constructor 
  public Character() {
    myColor = color(0, 0, 0); //black color
    posX = posY = angle = 0;
    radius = RADIUS; //outside circle 
    out = true;
  }

  //overload constructor
  public Character (float posX, float posY, float radius, int size, int angle, boolean out, color myColor) {
    this.posX = posX;
    this.posY = posY;
    this.radius = radius; 
    this.size = size; 
    this.out = out; 
    this.angle = angle;
    this.myColor = myColor;
  }

  public void drawCharacter() {
    fill(myColor); 
    noStroke();
    ellipse(posX, posY, size, size);
    updateCoordinates(2);
    stroke(10); //resets stroke
    fill(0); //default color of black
  }

  public void updateCoordinates(int dx) {
    angle = (angle + dx) % 360; //changing 2 will change the speed in which the character moves around the circle 
    posX = width/2 + radius * cos(radians(angle));  //width/2 centers the x cor of character
    posY = height/2 + radius * sin(radians(angle)); //height/2 centers the y cor of character
  }

  public void switchSides() {
    if (out) {
      out = false; 
      radius = radius - size;
    } else {
      out = true;
      radius = RADIUS;
    }
  }
  // ------------------- accessors -----------------------
  public float getPosX() {
    return posX;
  }

  public float getPosY() {
    return posY;
  }

  public float getRadius() {
    return radius;
  }

  public int getSize() {
    return size;
  }

  public int getAngle() {
    return angle;
  }

  //------------------ end of accessors -------------------

  public int setAngle(int newAngle) {
    int oldAngle = angle; 
    angle = newAngle; 
    return oldAngle;
  }

  public boolean setOut(boolean newOut) {
    boolean oldOut = out; 
    out = newOut;
    return oldOut;
  }
} //end of class 