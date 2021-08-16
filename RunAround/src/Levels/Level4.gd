extends Node2D

onready var anim_player = get_node("Player/AnimationPlayer")

signal change_message(message)
signal inventory_changed(name, image)
signal remove_barrier()

func _ready() -> void:
	self.connect("change_message", $Messages, "_update_message")
	self.connect("inventory_changed", $Inventory, "_on_inventory_changed")
	self.connect("remove_barrier", $shower/tub, "_remove_barrier")
	
	emit_signal("change_message", "Woah there kid, that was an old family recipe. Puking it up is kind of rude.")
	emit_signal("inventory_changed", "Olive Oil", "res://assets/oil.jpg")
	


func _on_DoorBlock_body_entered(body: Node) -> void:
	if body == $Player:
		emit_signal("change_message", "Oh dear, looks like you locked yourself in and your stubby little arms cant reach the lock (bad door design if you ask me).")


func _on_slippery_body_entered(body: Node) -> void:
	anim_player.play("roll")
	emit_signal("change_message", "Get down from there, it's too slippery to jump from!")

func _on_slippery2_body_entered(body: Node) -> void:
	emit_signal("change_message", "Get down from there, it's too slippery to- ! Well, I guess down the drain is one way out...")
	anim_player.play("roll")
	yield(get_tree().create_timer(2.0), "timeout")
	emit_signal("remove_barrier")


func _on_ResetButton_pressed() -> void:
	get_tree().reload_current_scene()
