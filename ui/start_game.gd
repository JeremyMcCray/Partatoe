extends Button


func _on_button_up() -> void:
	var party = $"..".party
	get_tree().change_scene_to_file("res://World/world.tscn")
	# This should create the "res://World/world.tscn" scene and pass the party through to run spawn_party
