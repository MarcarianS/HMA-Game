extends Node2D


var items: Array = []

func _on_inventory_changed(name):
	items.append(name)
	var number = 1
	for slot in $Grid.get_children():
		if slot.item_name == "item":
			var label = "Grid/Slot"+str(number)+"/Label"
			slot.item_name = name
			get_node(label).text = name
			number += 1
			return
		else:
			continue
			


		
