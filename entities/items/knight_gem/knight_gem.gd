extends Item

func update_stats() -> void:
	PlayerGlobal.party_size += 1
	PlayerGlobal.recruit("knight")

func get_view() -> String:
	return """
	Party Size: +1
	Knight: +1

	Price:  30 $
	"""
