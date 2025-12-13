extends Button

@export var party_member_scene_path : String

func _on_button_up() -> void:
	$"../../CoverPatch".z_index = 1
	var temp = load(party_member_scene_path)
	var character = temp.instantiate()
	
	var anim_path = load(character.menu_animation_path)
	var anim = anim_path.instantiate()
	get_parent().get_parent().add_child(anim)
	
	anim.scale = Vector2(3,3)
	anim.z_index = 2
	anim.global_position = $"../../Marker2D".global_position
	anim.play()
	get_parent().visible = false
	PlayerGlobal.party.append(character)
