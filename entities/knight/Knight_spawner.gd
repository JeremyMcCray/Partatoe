extends Node

var rng = RandomNumberGenerator.new()

@onready var player = get_tree().get_first_node_in_group("player")
@onready var knight_scene = load("res://player/knight.tscn")
@export var spawn_distance = 200
@export var max_knights = 5

var at_max = false

func _on_timer_timeout():
	handle_max_knights()
	if !at_max:
		spawn_a_knight()

func spawn_a_knight():
	var knight = knight_scene.instantiate()
	var randRad = rng.randf_range(0, 2)
	var knight_x = spawn_distance * sin(3.14 * randRad)
	var knight_y = spawn_distance * cos(3.14 * randRad)
	var knight_spawn_pos = Vector2(knight_x, knight_y) + player.global_position
	
	knight.position = knight_spawn_pos
	knight.add_to_group("knight")
	
	add_child(knight)
	

func handle_max_knights():
	var knights_count = get_tree().get_nodes_in_group("knight").size()
	if knights_count >= max_knights:
		at_max = true
	else:
		at_max = false
