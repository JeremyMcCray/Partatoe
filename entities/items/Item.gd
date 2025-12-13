class_name Item extends Node2D

@export var price: int

func get_view() -> String:
	return ""

func buy() -> bool:
	if PlayerGlobal.gold < price:
		print("Can't buy this")
		return false
	
	PlayerGlobal.gold -= price
	print("Buying Sword")
	return true
