class_name Item extends Node2D

@export var price: int

func get_view() -> String:
	return ""

func update_stats() -> void:
	pass

func buy() -> bool:
	if PlayerGlobal.gold < price:
		return false
	
	PlayerGlobal.gold -= price
	update_stats()
	return true
