extends CharacterBody2D

var movement_speed = 200.0
var health_points = 100

func _physics_process(_delta):
	movement()

func movement():
	var mov = Vector2(
		Input.get_joy_axis(0, JOY_AXIS_LEFT_X),
		Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)
	) 
	velocity = mov * movement_speed
	move_and_slide()

func _ready():
	add_to_group("player")
	PlayerGlobal.player = self
	PlayerGlobal.party = $UnitHolder.get_children()


func _on_unit_holder_child_exiting_tree(_node: Node) -> void:
	update_party()
	get_tree().create_timer(.2).timeout.connect(self.update_party)

func update_party():
	PlayerGlobal.update_party($UnitHolder.get_children())
