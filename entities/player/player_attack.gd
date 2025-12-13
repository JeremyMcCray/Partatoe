extends Area2D

@export var move_speed: float = 10.0

func _process(delta):
	var target_position = get_global_mouse_position()
	global_position = global_position.lerp(target_position, move_speed * delta)
	$ProgressBar.value+= 1
	
	if $ProgressBar.value >= $ProgressBar.max_value:
		$ProgressBar.value = 0
		$Rriof514.visible = true
		$AnimationPlayer.play("attack")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.take_damage(self,5)
