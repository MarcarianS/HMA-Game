extends Node2D

signal change_message(message)
signal inventory_changed(name, image)
signal freeze_player()

func _ready() -> void:
	self.connect("change_message", $Messages, "_update_message")
	self.connect("inventory_changed", $Inventory, "_on_inventory_changed")
	self.connect("freeze_player", $Player, "_on_pit_entered")
	$Player.connect("player_dead", $Messages, "_update_message")
	
	emit_signal("change_message", "Is this really how you wanted to spend your Saturday? Down the shower drain?")
	emit_signal("inventory_changed", "Olive Oil", "res://assets/oil.jpg")


func _on_slime_pit_body_entered(body: Node) -> void:
	emit_signal("freeze_player")


func _on_ResetButton_pressed() -> void:
	get_tree().reload_current_scene()
