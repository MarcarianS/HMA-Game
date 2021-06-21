extends Node2D

var inventory_resource = preload("res://src/Inventory/Inventory.gd")
var inventory = inventory_resource.new()

signal inventory_changed(name)

func _on_body_entered(body: Node) -> void:
	emit_signal("inventory_changed", "Backpack")
	queue_free()
