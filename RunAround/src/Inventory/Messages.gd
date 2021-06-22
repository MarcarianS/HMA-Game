extends RichTextLabel


signal item_grabbed(boolean)

		
func _make_decision(name):
	set_text("Do you want to pick up the "+name+"? (y or n)")
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pick_up_item"):
		emit_signal("item_grabbed", true)
		set_text("")
		return
	elif Input.is_action_pressed("leave_item"):
		set_text("")
		return

func _update_message(message):
	set_text(message)
