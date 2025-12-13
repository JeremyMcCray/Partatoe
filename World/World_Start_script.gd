extends Node2D

var knight_list : Array

@onready var kill_handler_scene = load("res://entities/kill_handler.tscn")
var kill_handler

func get_kill_handler():
	return kill_handler

func _ready():
	kill_handler = kill_handler_scene.instantiate()
	add_to_group("world")
