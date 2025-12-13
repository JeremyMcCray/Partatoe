extends Node2D

@export var radius: float = 10.0 # This needs to be increased/decresed with party size. #Mod
@export var rotation_speed: float = 0.2  # radians per second #Mod

var current_angle: float = 0.0

func _process(delta):
	current_angle += rotation_speed * delta

	var count = get_child_count()

	for i in range(count):
		var angle = current_angle + (TAU / count) * i
		var child = get_child(i)

		# Position the child on the circle
		child.position = Vector2(cos(angle), sin(angle)) * radius

		# Ensure upright sprite (no rotation)
		child.rotation = 0

	_update_depth_order()

func _update_depth_order():
	for child in get_children():
		child.z_index = child.global_position.y
