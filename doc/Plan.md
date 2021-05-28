0. Story Line
# General Points
This game is just about making it to the end without dying. Each level is a checkpoint,
and if you do die the player starts over from the beginning of that level.
Each level may build off another level in that you may need items from an early level later.
The game will not let you proceed without all the items you need (if you try,
you die with a message that should point you in the right direction.)
# Level One: Stuck
* Player begins stuck in a hole in the yard, given options of tools to get out
	* Shovel: digs a hole to China, player gets exhausted and dies ('Why would you try to dig down?')
	* Buncha balloons: Gets you out, but the player floats into space without the backpack on ('You need to go on an anti-diet)
	* Backpack: Contains a moldy sandwich, and other various tools. Grab before using the baloons, delivered safely.
# Level Two: The Great Outdoors
* Player flies out of the hole and is reminded why they fell in in the first place
* A hole in the fence let the neighbors geese through and they're bloodthirsty
	* Go back in the hole and hide (But they've spotted you and follow you down)
	* Using some wood in the backpack, run back through the hole to lead them home, escape, and patch up the hole. It's shaky, so if you don't get inside they'll escape again
	* make a break for the player's house. (the geese catch you)
# Level Three: Les Hors D'oeuvres
* A recipe on the wall of the kitchen says "A Tasty Treat that Can't be Beat
	* Something old enough to be growing it's own friends (for flavor!)
	* Something slippery
	* Some kind of carb
	* A mixing utensil
* In the tool bag, the moldy sandwich covers old and carb
* There will be olive oil on the counter
* Th pooper scooper in the bag should work to mix
* Eat and feel sick, Will let you run into the bathroom
# Level Four: I Don't Feel So Good...
* After throwing up, you realize there's a latch on the bathroom door and you can't reach
	* Jumping makes you slipand bonk your head on the toilet. ew.
	* The player gets a higher vantage point on the bathtub, but slips and falls down the shower drain. oops.
# Level Five: What in Tarnation
* At the bottom of the drain there's a tar pit. Player's sister must be going through some phase.
	* Try to swim, get stuck and drown
	* Coat yourself in olive oil and glide right through
# Level Six: 
1. Problem Analysis
* Godot runs each scene's script when the game runs
* No room is reached without the prior room's run function finishing
* Once each class has finished it's run function, the game is won
* The death function will give useful information based on how the user died
* The inventory scene will only be accessible while in an interaction zone
* Items will be picked up by y, left by n. 
* Different levels have different portals to the next level, depending on where in the house you are

2. System Analysis
# Characters 

# Player Scene (Custom Node, kinematicBody2d)
- Script
	- extends kinematicbody2d
	- classname CHaracter
	- physics process function
	- use move and slide
	- will need to have a gravity variable to float up with balloons
- extends kb2d
- physics_process 
	- use velocity and delta variables 
	- map arrow keys to move
	- use function press value, 1 = right, -1 = left
- when_on_wall to detect walls and items

- CollisionShape2d
	- Shape rectangle

# Geese Scene (KinematicBody2d)
- Script
	- extends kb2d
- collisionshape2d to detect player
- follows player around (how to do this?)

# Items ( Custom Node, Area2d Scene)
- Collision shape 2d
```
when area2d entered, give option to pick it up
add item to inventory and give message to describe item
```
- animation player
```
jump item when picked up
```
# Shovel
# Balloons
# Backpack
# Moldy sandwich
# Wood
# olive oil
# pooper scooper 

# Levels (2d scenes)
- Use tilemap for ground and house walls
- use area2d boxes for iteractable areas
- if inside an appropriate area, can use an item (Inventory icon pops up)
- give message to report on how succussful the item use was
- each level has a label at the top to give the player messages (invisible until applicable)

## Level 1
- area2d for the right edge
- if shovel is used, dig to China
- if use balloons without backpack, float away
- balloons w backpack floats into the portal hitbox to move to next level

## Level 2
- 
# Inventory (User interface scene)
- texture Rectangle
	- smaller than total gameplay window
- vboxcontainer and hboxcontainers
	- label for main title
	- texture button for exit
	- buttons for item boxes
	- click an item to try using it
	- item disappears from inventory when used  
- label for any margins
```
```
# Doors (Like portals)
- area2d when entered, play next scene
3. Functional Examples
4. Test Cases
