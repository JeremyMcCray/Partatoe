extends Area2D
@onready var _animation_player = $AnimationPlayer
@onready var _sprite = $Sprite2D
@onready var _collision = $CollisionShape2D
var value = 10
var grabbed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("loot")
	_animation_player.play("gold_spawn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Honestly this should only be called on body/mouse entered and on ready instead of checking every frame, could save insnae peformance
	if _animation_player.get_playing_speed() > 0 or _animation_player.get_playing_speed() < 0:
		_collision.disabled = true
	else:
		_collision.disabled = false
	pass
	if grabbed:
		if _animation_player.get_playing_speed() == 0:
			queue_free()
#on pick up 

func _on_body_entered(body):
	if body.is_in_group("knight") and grabbed == false:
		grabbed = true
		_animation_player.speed_scale = 1.75
		_animation_player.play_backwards("gold_spawn")
		body.loot_grabbed(self)
		PlayerGlobal.emit_signal("pick_up_gold", 10)

func loot_grabbed():
	if grabbed == false:
		grabbed = true
		_animation_player.speed_scale = 1.75
		_animation_player.play_backwards("gold_spawn")
		PlayerGlobal.emit_signal("pick_up_gold", 10)

#
#func _on_mouse_entered() -> void:
	#if grabbed == false:
		#grabbed = true
		#_animation_player.speed_scale = 1.75
		#_animation_player.play_backwards("gold_spawn")
		#PlayerGlobal.emit_signal("pick_up_gold",10)
