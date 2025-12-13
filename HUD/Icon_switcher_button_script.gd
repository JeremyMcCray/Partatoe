extends TextureButton

@export var mouse_mode :String 


func _on_pressed() -> void:
	PlayerGlobal.emit_signal("change_mouse_mode")
	var other_buttons = $"..".get_children()
	for button in other_buttons:
		if button != self:
			button.get_child(0).visible = false
			button.get_child(1).visible = true

	get_child(0).visible = true
	get_child(1).visible = false

	var mode = load(mouse_mode)
	var premode =  mode.instantiate()
	add_child(premode)
#This needs to have a 2 step thing to make sure they actually want to retreat
