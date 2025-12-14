extends Node2D

#TODO remove as a global we don't really need this as one?

@export var enemy_minimum_count : int 

var current_wave : int = 1
var wave_timer = 200
var spawn_enabled = true

var spawn_check_rate = 3.0  # Time interval to check and adjust spawn rates

var enemy_list = [
	{"name": "skeleton",
	 "cost": 1,
	 "path": "res://entities/enemies/skeleton/skeleton.tscn"
	}
]

var rng = RandomNumberGenerator.new()

func _ready() -> void:
		wave_timer += current_wave
		
		#every 3 seconds run spawn wave 
		get_tree().create_timer(spawn_check_rate).timeout.connect(self.spawn_decider)
		#Time out the wave after wave_timer
		get_tree().create_timer(wave_timer).timeout.connect(self.end_wave)
		

func spawn_decider():
	if spawn_enabled:
		spawn_wave(current_wave * 2 + randi_range(1,4))
		get_tree().create_timer(spawn_check_rate).timeout.connect(self.spawn_decider)
		#Also trigger whenever there aren't enough enemies
		#Mimimum is wavesize * 2
	
func spawn_wave(points:int):
	while(points > 0):
		var unit_to_spawn = enemy_list.pick_random()
		
		points = points - unit_to_spawn.cost
		
		var skeleton_load = load(unit_to_spawn.path)
		
		var skeleton = skeleton_load.instantiate()
		
		var skeleton_x = rng.randf_range(167, 856)
		var skeleton_y = rng.randf_range(141, 689)
		var skeleton_spawn_pos = Vector2(skeleton_x, skeleton_y)
		
		skeleton.position = skeleton_spawn_pos
	
		add_child(skeleton)
		skeleton.add_to_group("enemy")
		#spawn enemy

func end_wave():
	spawn_enabled = false
	GameManager.kill_all_enemies.emit()
	
	SceneLoader.load_scene("res://World/shop/shop.tscn")
	#get_tree().change_scene_to_file("res://World/world.tscn")
	#Transition to shop scene
	#Does the party need to be resaved to keep up to date between scene changing? is being in the global enough?
