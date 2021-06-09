extends "res://src/Actors/actor.gd"

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	_velocity = position.direction_to($"../Player".position) * speed
	_velocity = move_and_slide(_velocity, Vector2.UP)
