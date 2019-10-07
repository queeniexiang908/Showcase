# WaffledOctopie
### Queenie Xiang, Terry Guan, Fabiola Radosav

### Antikythera
Welcome to Antikythera! Antikythera is the name of a Greek analogue computer used to predict astronomical positions and eclipses.

### Introduction Page
<p> Upon entering the game, you will encounter the introduction page. This page will contain all instructions and rules necessary for understanding the game. It will consist of buttons of options the player can choose. For example, the player can choose to play the game or read the instructions. </p>

### The game
<p> Antikythera is based off of various versions of already established internet games, such as color switch, where the objective of the game is to avoid all enemies for as long as possible. There is a pre-determined circle track that the player is allowed to move around at a pre-set constant velocity. The enemies will spawn at random locations at random times according to the level difficulty. The player is allowed to switch between the outer and inner edge of the circle by pressing the space bar to avoid enemies.The player can also pick up upgrades to increase its survival rate. The player may also pause the game to buy an upgrade using the points he or she had earn. </p>

### How it works

#### isTouching() Method
<p> This method entails checking the distance between the player and either an enemy or an upgrade item. If the player is touching an enemy, the player dies, and the game ends. If the player is touching an upgrade item, the player picks up the item and the item is added to the storage stack. </p>

#### Enemies
<p> Enemies will be held and kept track of by a priority queue. Enemies will be sorted according to their difficulty. As the level difficulty increases, the average level of the enemies in the priority queue and the number of enemies being displayed will increase. Enemies will spawn in gray symbolizing that they're about to spawn in that position. Gray enemies cannot kill the player. </p>
<p> There are two types of enemies so far. One type is stationary and allowed to be spawned anywhere on the circle, additionally with a 50%-50% chance of spawning on either the outer and inner edge. The second type of enemy moves around the circle, just like the player, in the same direction of the player but at a different angular velocity.  </p>
<p> Enemies are spawned using an ArrayPriority Queue. The enemy with the highest priority times itself and disappears after 2 seconds, unless an enemy with higher priority spawns and takes the place of the previous highest priority enemy in the priority queue. When this happens, the new enemy starts timing itself for 2 seconds, and once it disappears, the previous enemy continues timing itself. This process occurs for every enemy in the priority queue. Consequently, enemies are kept alive for an arbitrary amount of time. This is the result of our keeping track of the time of only the peekable enemy of the priority queue. An easy way of summarizing this effect is by relating it to someone saving another person. Initially, there is an enemy timing itself until its death. However, another enemy with a higher priority can spawn and replace the previous peekable enemy with itself. Consequently, the new enemy is counting down its life clock and saving the previous one from reaching its death.

#### Upgrades
<p>When an upgrade is collected, it is stored in a stack. The player picks up these upgrades by moving to the location of the upgrade item. The isTouching() method will be used to determine if the player is able to pick up an item. This forces a limitation on the game where the user is only allowed to use the last upgrade it picked up. There are three types of upgrades: slow down, double points, and immunity. Slow down decreases the frame rate of the game, thus decreasing the speed of movement of both the player and enemies. This effect will last for a duration of 3.5 seconds. Double points will double the amount of points received normally per second for a duration of 5 seconds.  The immunity upgrade will prevent the player from dying in a span of 4 seconds. Once this time passes however, the player is once again mortal. </p>

#### Circular Movement
<p> The game also achieves the circle movement effect by using the angular velocity formulas x = a + Rcos(wt + z), y =b + Rsin(wt + z) where z is the initial angle, w is the change in angle,t is time, R is the radius, and (a,b) is the center of a circle with radius R. The touching() method which determines whether an enemy or upgrade is touching the player is determined by calculating the linear distance from the player and the enemy or upgrade. </p>


### Launch instructions
0. If you don't have processing, go download processing
1. Go to your terminal or command prompt
2. Type in:
````
git clone git@github.com:queeniexiang/WaffledOctopie.git
````
Now you've cloned the WaffledOctopie Repo!

Continue by typing in:
````
cd WaffledOctopie
cd Antikythera
processing Antikythera.pde
Ctrl + R to run or press the run button to start the game
````
Upon entering the introduction page, the player can choose to read the instructions or dive right into the game. The game can be started by pressing spacebar, and the instructions can be reached by pressing 1. The game will start immediately after pressing space. After the game starts the player will spawn on the top of the circle (at degree 0) and begin moving while enemies are randomly spawned along the outer and inner sides of the circle.
To access the upgrade menu, press p. You cannot access the upgrade menu until you have at least 300 points-- the minimum amount of points required to purchase an upgrade. The upgrade menu is also the pausing mechanism of the game and so players without the minimum points to purchase an upgrade (300) cannot pause the game. When in the upgrade menu, there will be descriptions, priceses, and keys to press to buy the upgrades listed for each upgrade. The number shown in each box is the number of points that will be deducted from your score if you decide to purchase an upgrade. If you decide not to purchase an upgrade, just press p to return to the game. If a player loses then he or she can restart the game by pressing space.
