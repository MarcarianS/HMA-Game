extends Node2D

signal inventory_changed(name)
signal update_message(message)

func _ready() -> void:
	self.connect("inventory_changed", $Inventory, "_on_inventory_changed")
	$Player.connect("player_dead", $Messages, "_update_message")
	self.connect("update_message", $Messages, "_update_message")
	$Messages.set_text("Hm, I wonder why you were down in that pit?")
	emit_signal("inventory_changed", "Wood", "res://assets/wood.png")
	emit_signal("inventory_changed", "Moldy Sandwich", "res://assets/sandwich.jpg")
	emit_signal("inventory_changed", "Pooper Scooper", "res://assets/shovel.png")


func _on_TrapSwitch_pressed() -> void:
	if get_node_or_null("Inventory/Wood"):
		for wood in $Inventory.get_children():
			if "Wood" in wood.name:
				wood.rotate(PI/2)
				$TrapSwitch.release_focus()
	else:
		emit_signal("update_message", "Looks like that will trigger some kind of trap. But I don't see anything built yet?")


func _on_ResetButton_pressed() -> void:
	get_tree().reload_current_scene()


func _on_off_map_detector_body_entered(body: Node) -> void:
	if body == $Player:
		get_tree().reload_current_scene()
