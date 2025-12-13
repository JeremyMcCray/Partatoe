extends Area2D

@export var move_speed: float = 10.0

func _ready() -> void:
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	PlayerGlobal.change_mouse_mode.connect(turn_off)

func _process(delta):
	var target_position = get_global_mouse_position()
	global_position = global_position.lerp(target_position, move_speed * delta)
	$ProgressBar.value+= 1
	
	if $ProgressBar.value >= $ProgressBar.max_value:
		$ProgressBar.value = 0
		$CPUParticles2D.emitting = true
		#Turn on hitbox for a second to heal
		$CollisionShape2D.disabled = false
		await get_tree().create_timer(0.1).timeout
		$CollisionShape2D.disabled = true


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("knight"):
		body.heal(5)

func turn_off():
		self.queue_free()
	
