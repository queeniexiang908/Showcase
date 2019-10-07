final int RADIUS = 400;
Player player;
Enemy enemy; 
PriorityQueue enemyContainer; 
ArrayList<Upgrades> UpgradesDisplayer;
LLStack upgradesStorage; 
LLStack Upgrades; 
int state, previousState; 
boolean useUpgrades;
int circleSize, currentScore, highScore, difficulty, difficulty2; //difficulty is a var for time in sec and difficulty2 is a var for time in millisec


void setup() {
  background(0); 
  fullScreen();
  state = 0;
  circleSize = 15;
  state = previousState = 0; 
  useUpgrades = false; 
  currentScore = highScore = 0; 
  player = new Player();
  enemyContainer = new PriorityQueue();
  UpgradesDisplayer = new ArrayList<Upgrades>();
  upgradesStorage = new LLStack();
  Upgrades = new LLStack(); 
  difficulty = 3; 
  difficulty2 = 55;
}

void draw() {
  switch (state) {
  case 0: //state of very beginning of game
    drawIntroMenu(); 
    break; 
  case 1: //state of playing game
    playGame();
    break;
  case 2: //paused menu
    pauseMenu();
    break;
  case 3: //state of dead
    resetGame();
    break;
  case 4: //state uof instructions
    drawInstructions(); 
    break;
  }
}

//switches character's edge upon hitting space
void keyPressed() {
  if (key == ' ') { 
    if (state == 1)
      player.switchSides();  
    else if (state == 3) { //dead state
      currentScore = 0;
      state = 1;
    }
    else 
      state = 1;
  }
  if (key == 'p') {
    if (state == 2) {
      state = 1;
    }
    if (currentScore >= 300) 
      state = 2;
  }
  if (state == 2) {
    Upgrades x;
    if (key == 'q') { 
      x = new UpgradeDoublePoints();
      if (currentScore >= x.getCost()) {
        upgradesStorage.push(x);
        currentScore -= x.getCost();
      }
    } 
    if (key == 'w') {
      x = new UpgradeSlowDown();
      if (currentScore >= x.getCost()) {
        upgradesStorage.push(x);
        currentScore -= x.getCost();
      }
    }
    if (key == 'e') {      
      x = new UpgradeImmunity();
      if (currentScore >= x.getCost()) {
        upgradesStorage.push(x);
        currentScore -= x.getCost();
      }
    }
  }
  if (key == '1') {
    if (state == 4)
      state = previousState; 
    else {
      previousState = state;
      state = 4;
    }
  }
  if (key == 'z' && !upgradesStorage.isEmpty())
    useUpgrades = true;
}

//------------------ GAME METHODS -------------------
//for when the game is still playing 
void playGame() {
  if (isDead()) {
    state = 3;
  }
  determineDifficulty();
  background(0);
  //frameRate(10);
  drawCircle(); //draws map
  drawUpgradeContainer();
  spawnUpgrades();
  if (frameCount%2 == 0)
    currentScore += 1; //1 point per 2 frame
  textSize(50); 
  text(currentScore, width/2 - 25, height/2 + 15);    
  player.drawCharacter();
  addEnemy(); //will only add enemy every 5 seconds
  drawEnemies(); //draws all enemies onto the screen
  drawUpgrades(); //draws all upgrades onto the screen
  if (useUpgrades)
    useUpgrades();
  cleanEnemies(); //removes dead enemies from screen
}

//when the player enters the pause menu
void pauseMenu() {
  background(0); 
  drawUpgradeMenu();
}

//when the player dies the game resets itself and updates the highscore if need be
void resetGame() {
  background(0);
  fill(255); 
  enemyContainer = new PriorityQueue(); 
  upgradesStorage = new LLStack(); 
  UpgradesDisplayer = new ArrayList<Upgrades>(); 
  textSize(50); 
  text(currentScore, width/2 - 25, height/2 + 15); //prints final score
  if (currentScore >= highScore) {
    highScore = currentScore; 
    textSize(20); 
    text("Congratulations! You beat the highscore", width/2 - 150, height/2 - 40);
  }
  
  else {
    textSize(20);
    text("Better luck next time! Your score is " + "\n", width/2-150, height/2 - 40); //prints final score
  } 
  player = new Player();
}
//determines difficulty of game based on currentScore
void determineDifficulty() {
  if (currentScore == 400) {
    difficulty2 = 40;
  }
  if (currentScore == 600) {
    difficulty = 2;
  }
  if (currentScore == 2000) {
    difficulty2 = 30;
  }
  if (currentScore> 4000 && currentScore%1000 == 0 && difficulty2 != 0) {
    if (currentScore == 4000)
      difficulty = 1;
    difficulty2 -= 1;
    System.out.println(difficulty2);
  }
}

// ---------------------------- ENEMY METHODS ---------------------------
boolean isDead() { //checks if the player is touching any enemies at all
  for (int i = 0; i < enemyContainer.size(); i++) {
    if (player.touching(enemyContainer.get(i)))
      return true;
  }
  return false;
}

//every 10 seconds add an enemy . The new enemy is decided randomly
void addEnemy() {
  if (second()%difficulty == 0 && frameCount%difficulty2 == 0) {  //checks to see if x seconds passed and that if it is 1 frame within the 60 fps
    float dec = random(100);
    Enemy adder; 
    if (dec > 50)
      adder = new EnemyOne(); 
    else 
    adder = new Enemy(); 
    enemyContainer.add(adder);
  }
}

void drawEnemies() { //draws all enemies in the priorityQueue
  for (int i = 0; i < enemyContainer.size(); i++) {
    enemyContainer.get(i).drawCharacter();
  }
}

void cleanEnemies() {
  if (enemyContainer.isEmpty())
    return; 
  if (enemyContainer.pop().isDead())
    enemyContainer.remove();
}


// ----------------------- UPGGRADE METHODS -----------------------
void spawnUpgrades() { 
  if (frameCount%900 == 0 && random(100) > 50) { //60 fps * 10 s = 600
    Upgrades adder;
    float x = random(100); 
    if (x < 25) 
      adder = new UpgradeSlowDown(); 
    else if (x < 50)
      adder = new UpgradeDoublePoints();
    else 
    adder = new UpgradeImmunity(); 
    UpgradesDisplayer.add(adder);
  }
}

void useUpgrades() {
  if (upgradesStorage.isEmpty())
    return;
  if (upgradesStorage.peek().stillWorking()) {
    upgradesStorage.peek().useUpgrade();
  } else {
    upgradesStorage.pop();
    useUpgrades = false;
  }
}

void drawUpgrades() {
  Upgrades x;
  for (int i = 0; i < UpgradesDisplayer.size(); i++) {
    x = UpgradesDisplayer.get(i); 
    x.drawUpgrades(); 
    if (player.touchingUpgrades(x) && upgradesStorage.size() <= 3) { //limits the player to collect only 3 upgrades
      upgradesStorage.push(x);
      UpgradesDisplayer.remove(i);
    }
  }
}

//draws the most recently acquired upgrade on the side of the 
void drawUpgradeContainer() {
  if (!upgradesStorage.isEmpty()) {
    upgradesStorage.peek().drawUpgrades(40, height - 40);
  }
}

// ---------------------------------------------- HARDCODED MENU METHODS -----------------------------------
//draws two circles. There is an outer circle that represents the outer edge circle and an inner
//circle that will help form the inner edge
void drawCircle() {
  float r = 2 * RADIUS - player.getSize();
  fill(245); 
  ellipse(width/2, height/2, r, r); //draws outer circle
  fill(0); //makes inner circle black. Appears concentric
  ellipse(width/2, height/2, r - 2 * player.getSize() - circleSize, r - 2 * player.getSize() - circleSize); // draws inner circle... 15 is an arbitrary number used for appearance sake
  fill(255); //resets filling to be white
}

//draws the menu for when the player pauses and is making a purchase for upgrades
void drawUpgradeMenu() {
  //ADD CURRENT SCORE IN CORNER
  fill(255);
  textSize(50);
  text("Paused", width/2 - 100, height/2 - 200);
  fill(255);
  textSize(25);
  text("Choose an upgrade for a certain amount of earned points or press P to return to game", width/6 - 50, height/2 - 100);
  text("Current Score: " + currentScore, width/6 - 50, height/2 - 50);
  //double points
  fill(255);
  rect(width/8, height/2, 250, 210);
  textSize(30);
  fill(0);
  text("Double Points", width/8 + 25, height/2 + 40);
  text("-500 pts", width/8 + 40, height/2 + 100);
  //description  
  textSize(20);
  fill(0);
  text("earn double points for a", width/8 + 4, height/2 + 155);
  text("limited amount of time", width/8 + 7, height/2 + 180);
  text("Buy: press q", width/8 + 7, height/2 + 200);
  //slow down    
  fill(255);
  rect(width/2 - 135, height/2, 250, 200);
  textSize(30);
  fill(0);
  text("Slow Down", width/2 - 90, height/2 + 40);
  text("-300 pts", width/2 - 80, height/2 + 100);
  textSize(20);
  fill(0);
  text("slow down enemies", width/2 - 100, height/2 + 165);
  text("Buy: press w", width/2 - 100, height/2 + 185);
  //survive three hits
  fill(255);
  rect(5*(width/8) + 55, height/2, 250, 200);
  textSize(30);
  fill(0);
  text("Immunity", 5*(width/8) + 110, height/2 + 30);
  text("-700 pts", 5*(width/8) + 120, height/2 + 100);  
  textSize(20);
  text("Immune to enemies for 4 seconds", 5*(width/8) + 105, height/2 + 160);
  text("Buy: press e", 5*(width/8) + 120, height/2 + 185); 
  fill(0);
}

//draws start menu
void drawIntroMenu() {
  background(0);
  fill(0, 100, 255);
  textSize(60);
  text("Antikythera", width/2 - 200, height/2 - 200);
  //play
  fill(255);
  textSize(30);
  text("Press space to play", width/2 - 200, height/2 - 40);
  //instructions
  text("Press 1 for instructions", width/2 - 200, height/2 + 40);
}

//draws instructions for gameplay
void drawInstructions() {
  background(0);
  fill(255);
  textSize(40);
  text("Traverse the circle avoiding the enemies. You can pop in or out of the circle's edge by", 50, 100);
  text("pressing the spacebar. Collect upgrades to help your endeavor. There are three different", 50, 150);
  text("upgrades.The one symbolized by a 2 doubles the earning points for 5 seconds. The one ", 50, 200);
  text("symbolized by a 't' slows down the time. A side effect is it slows down points earning", 50, 250);
  text("proportionally. The upgrade with a 3 represents immunity and will make the player immune", 50, 300);
  text("to all enemies for 4 seconds. You can also buy upgrades by accessing the pause menu in game", 50, 350);
  text("by pressing p. The pause menu can only be accessed if you have greater than 300 points. The", 50, 400);
  text("currency is your earned points.", 50, 450);
}