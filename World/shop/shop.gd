extends Node2D

func ready() -> void:
	add_child(PlayerGlobal.player)
	PlayerGlobal.player.global_position = $SpawnLocation.global_position
