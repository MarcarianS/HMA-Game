extends Node2D

signal give_inventory(inventory)


var _items: Array = []
var _item_selected = []

func _ready() -> void:
	var number = 1
	for slot in $Grid.get_children():
		var button = "Grid/Slot"+str(number)+"/TextureButton"
		var highlight = "Grid/Slot"+str(number)+"/Highlight"
		get_node(button).connect("item_selected", self, "_on_item_selected")
		#get_node(highlight).connect("item_selected", self, "_on_item_selected")
		number += 1

func _on_inventory_changed(name, image):
	_items.append(name)
	var number = 1
	for slot in $Grid.get_children():
		if slot.item_name:
			number += 1
			continue
		else:
			var button = "Grid/Slot"+str(number)+"/TextureButton"
			var label = "Grid/Slot"+str(number)+"/Label"
			slot.item_name = name
			get_node(button).set_normal_texture(load(image))
			get_node(button).item_name = name
			get_node(button).slot_number = number
			get_node(label).text = name
			emit_signal("give_inventory", self)
			return
	
			
func get_items():
	return _items
	
func _on_item_selected(name, slot_number):
	var resource
	if !_item_selected.empty():
		get_node("Grid/Slot" + str(slot_number) + "/Highlight").visible = false
		_item_selected.clear()
	else:
		get_node("Grid/Slot" + str(slot_number) + "/Highlight").visible = true
		match name:
			"Wood":
				resource = load("res://src/Items/Wood.tscn")
			"Moldy Sandwich":
				resource = load("res://src/Items/MoldySandwich.tscn")
			"Pooper Scooper":
				resource = load("res://src/Items/PooperScooper.tscn")
			"Olive Oil":
				resource = load("res://src/Items/OliveOil.tscn")
		var instance = resource.instance()
		_item_selected.clear()
		_item_selected.append(instance)
		_item_selected.append(slot_number)
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if !_item_selected.empty():
			var x = event.position.x
			var y = 550
			var pos = Vector2(x, y)
			_item_selected[0].set_position(pos)
			self.add_child(_item_selected[0])
			get_node("Grid/Slot"+ str(_item_selected[1]) + "/Highlight").visible = false
			_item_selected.clear()


