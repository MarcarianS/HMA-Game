extends TextureButton

export var item_name: String
export var slot_number: int

signal item_selected(name, number)

func _on_pressed() -> void:
	emit_signal("item_selected", self.item_name, self.slot_number)


