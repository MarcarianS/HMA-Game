extends Node2D

func _ready() -> void:
	$Backpack.connect("inventory_changed", $Inventory, "_on_inventory_changed")
