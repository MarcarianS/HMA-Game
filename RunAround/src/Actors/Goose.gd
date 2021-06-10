extends "res://src/Actors/actor.gd"

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	_velocity = position.direction_to($"../Player".position) * speed
	if _velocity.y < 0:
		_velocity = move_and_slide(Vector2(_velocity.x, 0.0), FLOOR_NORMAL)
	else:
		_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	get_direction(_velocity)

func get_direction(_velocity: Vector2) -> void:
	if _velocity.x < 0:
		$goose_left.visible = true
		$goose_right.visible = false
	elif _velocity.x > 0:
		$goose_right.visible = true
		$goose_left.visible = false
	else:
		return

