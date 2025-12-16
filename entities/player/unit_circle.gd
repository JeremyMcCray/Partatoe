#unit_circle
extends Node2D

@export var radius: float = 25.0 # This needs to be increased/decresed with party size. #Mod
@export var rotation_speed: float = 1 # radians per second #Mod

@export var position_smooth_speed := 10.0

var current_angle: float = 0.0

func _ready() -> void:
	PlayerGlobal.on_recruit.connect(add_unit)
	$PartySpawner.spawn_party()

func add_unit(data: UnitData) -> void:
	var unit = preload("res://entities/knight/knight.tscn").instantiate()
	unit.data = data
	add_child(unit)

func _process(delta):
	current_angle += rotation_speed * delta

	var units := _get_units()
	var count := units.size()
	if count == 0:
		return

	for i in range(count):
		var unit := units[i]

		var target_angle := current_angle + (TAU / count) * i
		var target_pos := Vector2(cos(target_angle), sin(target_angle)) * radius

		# Smooth movement instead of snapping
		unit.position = unit.position.lerp(
			target_pos,
			1.0 - exp(-position_smooth_speed * delta)
		)

		unit.rotation = 0

	_update_depth_order(units)

func _update_depth_order(units: Array[CharacterBody2D]) -> void:
	for unit in units:
		unit.z_index = unit.global_position.y

func _get_units() -> Array[CharacterBody2D]:
	var units: Array[CharacterBody2D] = []
	for child in get_children():
		if child is CharacterBody2D:
			units.append(child)
	return units
