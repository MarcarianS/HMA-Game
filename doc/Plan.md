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
* The program is run, and calls the story class
* The inventory is an attribute of the story class (probably a set)
* story.run is like a chronological holding for each room. 
* No room is reached without the prior room's run function finishing
* Each room has it's own class (or whether that class is used directly or factory is undecided)
* Once each class has finished it's run function, the game is won
* Each room's class will have a run function and a death function
* The death function will give useful information based on how the user died, and will return back to the top of run 
* Each room has a temp inventory that reflects what the inventory looked like when the room was entered, which death will use to reset the inventory.
* 
2. System Analysis
# Characters 

# Player Scene (Custom Node, kinematicBody2d)
## Script
- extends kinematicbody2d
- classname CHaracter
- physics process function
- use move and slide
## Sprite node
## CollisionShape2d
* Shape rectangle

# Geese Scene (KinematicBody2d)
## Script
- extends kb2d

# Items
# Shovel
# Balloons
# Backpack
# Moldy sandwich
# Wood
# olive oil
# pooper scooper 
# Ladder

# Levels (2d scenes)
- Use tilemap for ground and house walls

# Doors (Like portals)
3. Functional Examples
4. Test Cases
