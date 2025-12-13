extends Area2D

@export var move_speed: float = 10.0

func _ready() -> void:
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	PlayerGlobal.change_mouse_mode.connect(turn_off)

func _process(delta):
	var target_position = get_global_mouse_position()
	global_position = global_position.lerp(target_position, move_speed * delta)

func turn_off():
		self.queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("loot"):
		area.loot_grabbed()
