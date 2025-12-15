#player
extends CharacterBody2D

func _ready():
	add_to_group("player")
	PlayerGlobal.player = self

var movement_speed = 200.0

var interactable: Node2D

func _physics_process(_delta):
	if interactable != null && (Input.is_action_just_released("interact")):
		interactable.use()
	
	movement()

func movement():
	var mov = Vector2(
		Input.get_joy_axis(0, JOY_AXIS_LEFT_X),
		Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)
	) 
	velocity = mov * movement_speed
	move_and_slide()
