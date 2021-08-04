extends actor

signal player_dead(message)
export var is_ready = false
export var has_backpack = false

func _physics_process(_delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

func _ready_balloon(on_balloon):
	if on_balloon:
		is_ready = true
		
func _ready_backpack(grabbed_backpack):
	if grabbed_backpack:
		has_backpack = true
	

func get_direction() -> Vector2:
	var y_velocity = 1.0
	if (Input.is_action_just_pressed("jump") and is_on_floor()):
		y_velocity = -1.0
	elif is_ready and ($"../Player".position.y > 200 or !has_backpack):
		y_velocity = -1.0
		print("on ballon, don't have backpack")
	elif is_ready and $"../Player".position.y < 200 and has_backpack:
		y_velocity = 1.0
	print(y_velocity)
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		y_velocity
		)

func calculate_move_velocity(
	linear_velocity: Vector2, direction: Vector2, speed: Vector2, is_jump_interrupted: bool
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speed.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	return out



func _on_GooseDetector_body_entered(body: Node) -> void:
	if body == $"../Goose":
		queue_free()
		emit_signal("player_dead", "Killer geese are the worst... Maybe you could build something to slow it down? If you want to try again, you can always reset by clicking on your face in the corner!")

func _on_pit_entered():
	if $"../Inventory".get_child_count() == 2:
		_velocity = Vector2(0.0, 0.0)
		speed = Vector2(0.0, 0.0)
		gravity = 0
		emit_signal("player_dead", "Oh no, those little guys are pretty sticky, and they seem to be grabbing onto you...")
	else:
		emit_signal("player_dead", "Genius! These grubby little slime hands stand no chance holding onto you... coated in olive oil? Well, at least you're resourceful")
	
