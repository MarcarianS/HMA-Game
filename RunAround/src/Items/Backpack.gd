extends Node2D


signal item_encountered(name)
signal inventory_changed(name)

func _on_body_entered(body: Node) -> void:
	print("backpack entered")
	emit_signal("item_encountered", "Backpack")


func _item_grabbed(boolean) -> void:
	if boolean:
		emit_signal("inventory_changed", "Wood")
		emit_signal("inventory_changed", "Moldy Sandwich")
		emit_signal("inventory_changed", "Pooper Scooper")
		queue_free()
