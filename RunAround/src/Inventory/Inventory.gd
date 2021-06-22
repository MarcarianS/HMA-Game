extends Node2D

signal give_inventory(inventory)

var _items: Array = []

func _on_inventory_changed(name):
	_items.append(name)
	var number = 1
	for slot in $Grid.get_children():
		if slot.item_name:
			number += 1
			continue
		else:
			var label = "Grid/Slot"+str(number)+"/Label"
			slot.item_name = name
			get_node(label).text = name
			emit_signal("give_inventory", self)
			return
	
			
func get_items():
	return _items		
