extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	SceneLoader.load_scene("res://World/world.tscn")
