extends actor

var is_ready: bool = false

func _on_body_entered(body: Node) -> void:
	is_ready = true


func _physics_process(delta: float) -> void:
	if is_ready:
		_velocity = Vector2(0.0, -1.0 * speed.y)
		_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	else:
		_velocity = Vector2(0.0, 0.0)
