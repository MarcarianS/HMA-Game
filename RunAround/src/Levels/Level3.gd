extends Node2D

var items: Array

signal message_changed(message)
signal inventory_changed(name, image)
signal remove_barrier()

func _ready() -> void:
	print($Inventory.get_child_count())
	self.connect("message_changed", $Messages, "_update_message")
	self.connect("inventory_changed", $Inventory, "_on_inventory_changed")
	$OliveOil.connect("item_encountered", $Messages, "_make_decision")
	$Messages.connect("item_grabbed", $OliveOil, "_item_grabbed")
	$OliveOil.connect("inventory_changed", $Inventory, "_on_inventory_changed")
	$Inventory.connect("give_inventory", self, "_get_items_from_inventory")
	self.connect("remove_barrier", $DoorBlock, "_remove_barrier")
	
	emit_signal("inventory_changed", "Moldy Sandwich", "res://assets/sandwich.jpg")
	emit_signal("inventory_changed", "Pooper Scooper", "res://assets/shovel.png")
	
	$Messages.set_text("A tasty treat that can't be beat: Some Carbs, Some Fat, An Old Friend. Instructions: Mix together in a bowl and enjoy!")

func _get_items_from_inventory(inventory):
	items = inventory.get_items()

func _on_PlayerDetector_body_entered(body: Node) -> void:
	emit_signal("message_changed", "You don't really look like you need to use the bathroom...")


func _on_PlayerDetector_body_exited(body: Node) -> void:
	emit_signal("message_changed", "A tasty treat that can't be beat: Some Carbs, Some Fat, An Old Friend. Instructions: Mix together in a bowl and enjoy!")


func _on_Bowl_body_entered(body: Node) -> void:
	if $Inventory.get_child_count() == 2:
		emit_signal("message_changed", "0/3 items collected.")
	elif $Inventory.get_child_count() == 3 and get_node_or_null("Inventory/MoldySandwich"):
		emit_signal("message_changed", "2/3 items collected.")
	elif $Inventory.get_child_count() == 3 and get_node_or_null("Inventory/OliveOil"):
		emit_signal("message_changed", "1/3 items collected.")
	elif $Inventory.get_child_count() == 3 and get_node_or_null("Inventory/PooperScooper"):
		emit_signal("message_changed", "Can't use that yet, but you can leave it there for kicks.")
	elif $Inventory.get_child_count() == 4 and get_node_or_null("Inventory/PooperScooper"):
		emit_signal("message_changed", "Not quite mixing time, but you're close!")
	elif $Inventory.get_child_count() == 4:
		emit_signal("message_changed", "3/3 items collected. Time to mix!")
	elif $Inventory.get_child_count() == 5:
		emit_signal("message_changed", "All mixed and ready to be enjoyed. Eat up!")
		yield(get_tree().create_timer(3.0), "timeout")
		emit_signal("message_changed", "You don't look so good, maybe my tasty treat was too much for your stomach to handle...")
		emit_signal("remove_barrier")

func _on_Bowl_body_exited(body: Node) -> void:
	emit_signal("message_changed", "A tasty treat that can't be beat: Some Carbs, Some Fat, An Old Friend. Instructions: Mix together in a bowl and enjoy!")
