extends Node2D

func _ready() -> void:
	$Backpack.connect("item_encountered", $Messages, "_make_decision")
	$Backpack.connect("inventory_changed", $Inventory, "_on_inventory_changed")
	$Messages.connect("item_grabbed", $Backpack, "_item_grabbed")
	$Inventory.connect("give_inventory", $Balloons, "_get_items_from_inventory")
	$Balloons.connect("send_message", $Messages, "_update_message")



func _on_ResetButton_pressed() -> void:
	get_tree().reload_current_scene()
