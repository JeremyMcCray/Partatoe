extends Item

func update_stats() -> void:
	PlayerGlobal.move_speed += 10
	PlayerGlobal.attack_speed += 10

func get_view() -> String:
	return """
	Move Speed: +10
	Attack Speed: +10
	
	Price: 15
	"""
