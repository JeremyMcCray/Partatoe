extends Node

signal kill_all_enemies

func lost_game():
	kill_all_enemies.emit()
	SceneLoader.load_scene("res://addons/maaacks_menus_template/base/nodes/menus/main_menu/lost_menu.tscn")
