extends Node2D


signal item_encountered(name)
signal inventory_changed(name)

func _on_body_entered(body: Node) -> void:
	emit_signal("item_encountered", "Backpack")


func _item_grabbed(boolean) -> void:
	if boolean:
		emit_signal("inventory_changed", "Wood", "res://assets/wood.png")
		emit_signal("inventory_changed", "Moldy Sandwich", "res://assets/sandwich.jpg")
		emit_signal("inventory_changed", "Pooper Scooper", "res://assets/shovel.png")
		queue_free()
