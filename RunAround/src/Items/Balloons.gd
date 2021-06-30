extends actor


var is_ready: bool = false
var items: Array

signal send_message(message)

func _get_items_from_inventory(inventory):
	items = inventory.get_items()

func _on_body_entered(body: Node) -> void:
	is_ready = true


func _physics_process(delta: float) -> void:
	if is_ready and !items.empty() and $"../Balloons".position.y > 30:
		emit_signal("send_message", "Going up!")
		_velocity = Vector2(0.0, -1.0 * speed.y)
		_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
		if $"../Balloons".position.y < 30:
			emit_signal("send_message", "I know it's exciting, but if you're gonna keep bouncing, how 'bout you bounce your way out of here?")
	elif is_ready and items.empty():
		_velocity = Vector2(0.0, -1.0 * speed.y)
		_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
		if $"../Balloons".position.y < 110:
			emit_signal("send_message", "Looks like you need to pack on a few pounds...")
		if $"../Balloons".position.y < -250:
			get_tree().reload_current_scene()
	else:
		_velocity = Vector2(0.0, 0.0)
