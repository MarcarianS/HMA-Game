extends Node2D

signal item_encountered(name)
signal inventory_changed(name)

func _on_body_entered(body: Node) -> void:
	emit_signal("item_encountered", "Olive Oil")

func _item_grabbed(boolean) -> void:
	if boolean:
		emit_signal("inventory_changed", "Olive Oil", "res://assets/oil.jpg")
		queue_free()
