extends Panel

export var item_name = "item"


func _on_inventory_changed(inventory):
	print("inventory changed")
	for slot in $GridContainer.get_children():
		if slot.item_name:
			print("you messed up")
			continue
		else:
			slot.item_name = inventory.item
			$slot.Label.set_text(str(inventory.item))
			slot.Texture = inventory.item_image
			print(str(inventory.item)+"hello")
			return
