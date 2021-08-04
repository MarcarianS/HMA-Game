extends Node2D

var has_backpack = false

signal item_encountered(name)
signal inventory_changed(name)
signal has_backpack(boolean)

func _on_body_entered(body: Node) -> void:
	emit_signal("item_encountered", "Backpack")
	


func _item_grabbed(boolean) -> void:
	if boolean:
		emit_signal("inventory_changed", "Wood", "res://assets/wood.png")
		emit_signal("inventory_changed", "Moldy Sandwich", "res://assets/sandwich.jpg")
		emit_signal("inventory_changed", "Pooper Scooper", "res://assets/shovel.png")
		has_backpack = true
		emit_signal("has_backpack", has_backpack)
		queue_free()
