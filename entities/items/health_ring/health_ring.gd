extends Item

func update_stats() -> void:
	PlayerGlobal.max_health += 10
	PlayerGlobal.health_regen += 1

func get_view() -> String:
	return """
	Max Health: +10
	Health Regen: +1

	Price:  10 $
	"""
