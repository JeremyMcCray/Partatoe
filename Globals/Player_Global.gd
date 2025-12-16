extends Node

signal health_updated(new_health: int)
signal gold_updated(new_gold: int)

signal max_health_updated(new_max_health: int)
signal attack_range_updated(new_range: int)
signal bonus_damage_updated(new_bonus_damage: int)
signal attack_speed_updated(new_attack_speed: int)
signal move_speed_updated(new_speed: int)
signal health_regen_updated(new_health_regen: int)
signal party_size_updated(new_party_size: int)

signal on_recruit(recruitable_scene)

@onready var recruitables: Dictionary = {
	"knight": load("res://entities/knight/knight_data.tres")
}

var player

var player_data : UnitData

var party_data : Array[UnitData] = []

func recruit(key: String) -> void:
	var data : UnitData = recruitables[key].duplicate() #Duplicate makes it so each knight has thier own stats and they aren't shared.
	add_party_member(data)
	on_recruit.emit(data)

func add_party_member(data: UnitData) -> void:
	party_data.append(data)

var health: int:
	set(new_health):
		health = new_health
		health_updated.emit(health)
		
var gold: int:
	set(new_gold):
		gold = new_gold
		gold_updated.emit(gold)
		
var max_health: int:
	set(new_max_health):
		max_health = new_max_health
		max_health_updated.emit(max_health)
		
var bonus_damage: int:
	set(new_bonus_damage):
		bonus_damage = new_bonus_damage
		bonus_damage_updated.emit(bonus_damage)

var attack_speed: int:
	set(new_attack_speed):
		attack_speed = new_attack_speed
		attack_speed_updated.emit(attack_speed)
		
var attack_range: int:
	set(new_attack_range):
		attack_range = new_attack_range
		attack_range_updated.emit(attack_range)

var move_speed: int:
	set(new_move_speed):
		move_speed = new_move_speed
		move_speed_updated.emit(move_speed)
		
var health_regen: int:
	set(new_health_regen):
		health_regen = new_health_regen
		health_regen_updated.emit(health_regen)
		
var party_size: int:
	set(new_party_size):
		party_size = new_party_size
		party_size_updated.emit(party_size)

func _ready() -> void:
	health = 100
	gold = 100
	max_health = 20
	bonus_damage = 5
	attack_speed = 1
	move_speed = 100
	health_regen = 1
	attack_range = 100
	party_size = 6

func get_player():
	return player
