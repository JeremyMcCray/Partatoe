extends Area2D
@onready var _animation_player = $AnimationPlayer
@onready var _collision = $CollisionShape2D
var value = 10
var grabbed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("loot")
	_animation_player.play("gold_spawn")
	GameManager.kill_all_enemies.connect(kill_self)

func _process(_delta):
	#Honestly this should only be called on body/mouse entered and on ready instead of checking every frame, could save insnae peformance
	if _animation_player.get_playing_speed() > 0 or _animation_player.get_playing_speed() < 0:
		_collision.disabled = true
	else:
		_collision.disabled = false
	
	if grabbed:
		if _animation_player.get_playing_speed() == 0:
			queue_free()
#on pick up

func _on_body_entered(body):
	if body.is_in_group("knight") and grabbed == false:
		grabbed = true
		_animation_player.speed_scale = 1.75
		_animation_player.play_backwards("gold_spawn")
		PlayerGlobal.gold += 10

func loot_grabbed():
	if grabbed == false:
		grabbed = true
		_animation_player.speed_scale = 1.75
		_animation_player.play_backwards("gold_spawn")
		PlayerGlobal.gold += 10

func kill_self():
	queue_free()
