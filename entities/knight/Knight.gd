extends CharacterBody2D

signal heal_s
signal killed

@export var movement_speed = 0
@export var base_movement_speed = 0
@export var health_points = 20
@export var health_points_max = 200
@export var menu_animation_path : String

@onready var _state_machine

var current_destination : Vector2
var moving : bool
var target = null
var potential_target_list = []
var attack_speed = 1
var loot_value = 0
var known_chests : Dictionary

var potion_count = 0
var knight_name


func _ready():
	self.add_to_group("knight")
	var machine = load("res://entities/knight/states/knight_state_machine.tscn")
	_state_machine = machine.instantiate()
	add_child(_state_machine)
	knight_name = random_name_list.pick_random()
	
	get_tree().create_timer(attack_speed).timeout.connect(self.attack)

func _physics_process(_delta):
	_process_animation_()

func got_a_kill(_killcount):
	killed.emit()

func _on_hurtbox_body_entered(body):
	if body.is_in_group("enemy"):
		body.take_damage(self,5)

func loot_grabbed(loot):
	loot_value += loot.value

func healing_potion_grabbed(potion):
	if health_points < health_points_max:
		health_points += potion.healing
		
	else:
		potion_count += 1

func heal(heal_amount:int):
	heal_animation()
	
	health_points += heal_amount
	
	$Control/HealthBar.value = health_points
	
	if health_points > health_points_max:
		health_points = health_points_max
	heal_s.emit(heal_amount)

func heal_animation():
	_knight_sprite.modulate = Color.GREEN_YELLOW
	$Heal_Sprite.visible = true
	$Heal_Sprite.play("heal")
	await get_tree().create_timer(0.35).timeout
	$Heal_Sprite.visible = false
	_knight_sprite.modulate = Color.WHITE


func take_damage(_enemy, damage):
	_knight_sprite.modulate = Color.RED
	await get_tree().create_timer(0.1).timeout
	_knight_sprite.modulate = Color.WHITE
	
	health_points -= damage
	
	$Control/HealthBar.value = health_points
	
	if health_points <= 0:
		var main_scene := get_tree().current_scene
		reparent(main_scene)
		_animation_player.play("Death")

#------------------Animation Processing
#@onready var _kill_counter_label = $Knight_Sprite2D/KillCounterLabel
@onready var _knight_sprite = $Knight_Sprite2D
@onready var _animation_player = $AnimationPlayer
var uninteruptable_animations = ["Swing_one","Swing_oneLeft","Death","Full Combo","Hurt"]
	
enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

func _process_animation_():
	if !uninteruptable_animations.has(_animation_player.get_current_animation()):
		var axis_x = Input.get_axis("left", "right")
		
		if axis_x == 0:
			_animation_player.play("Idle")
		elif axis_x < 0:
			_animation_player.play("RunLeft")
		else:
			_animation_player.play("Run")


func attack():
	if !uninteruptable_animations.has(_animation_player.get_current_animation()):
		var center = get_parent().global_position
		var is_right_side = global_position.x > center.x
		
		if is_right_side:
			_animation_player.play("Swing_one")
		else:
			_animation_player.play("Swing_oneLeft")
	get_tree().create_timer(attack_speed).timeout.connect(self.attack) 

func die():
	queue_free()

var random_name_list = [
  "Ser Morning",
  "Prince Charming",
  "Galandor the Valiant",
  "Lady Isolde",
  "Lord Cedric",
  "Brynden Ironheart",
  "Elara Fearless",
  "Sir Torric",
  "Lady Selene",
  "Ser Loras",
]
