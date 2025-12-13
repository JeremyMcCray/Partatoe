extends Node

signal health_updated(new_health: int)
signal speed_updated(new_speed: int)
signal range_multiplier_updated(new_range_multiplier: int)
signal damage_multiplier_updated(new_damage_multiplier: int)
signal money_updated(new_money: int)

var health: int:
	set(new_health):
		health = new_health
		health_updated.emit(health)
		
var speed: int:
	set(new_speed):
		speed = new_speed
		speed_updated.emit(speed)
		
var range_multiplier: float:
	set(new_range_multiplier):
		range_multiplier = new_range_multiplier
		range_multiplier_updated.emit(range_multiplier)
		
var damage_multiplier: float:
	set(new_damage_multiplier):
		damage_multiplier = new_damage_multiplier
		damage_multiplier_updated.emit(damage_multiplier)
		
var money: int:
	set(new_money):
		money = new_money
		money_updated.emit(money)

func _ready() -> void:
	health = 100
	speed = 100
	range_multiplier = 1.0
	damage_multiplier = 1.0
	money = 0

signal change_mouse_mode()

var party = []
