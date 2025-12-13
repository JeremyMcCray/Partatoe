extends Area2D

@onready var _sprite = $Sprite2D
@onready var _collision = $CollisionShape2D
var value = 10
var grabbed = false

func _on_body_entered(body):
	if body.is_in_group("knight") and grabbed == false:
		grabbed = true
		body.healing_potion_grabbed(self)
		queue_free()
	pass # Replace with function body.
