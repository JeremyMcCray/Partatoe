#party_spawner
extends Node2D

func spawn_party():
	for unit_data in PlayerGlobal.party_data:
		#TODO This needs to be more robust where it can spawn all the different unit types
		var unit = preload("res://entities/knight/knight.tscn").instantiate()
		unit.data = unit_data
		get_parent().add_child(unit)
