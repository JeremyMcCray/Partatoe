extends Enemy_unit

var rng = 1000

func _ready():
	GameManager.kill_all_enemies.connect(kill_self)
	super()

func _physics_process(_delta):
	_process_animation()
	
func _on_hurtbox_body_entered(body):
	if body.is_in_group("knight"):
		body.take_damage(self,5)

#------------------Animation Processing
var uninteruptable_animations = ["SwingOne","SwingOneLeft","Death","Full Combo","Hurt"]

func _process_animation():
	if !uninteruptable_animations.has(_animation_player.get_current_animation()):
		if self.velocity == Vector2(0,0):
			_animation_player.play("Idle")
		#walk left
		if self.velocity.x < 0:
			_animation_player.play("RunLeft")
		#walk right
		else:
			_animation_player.play("Run")


func _on_attack_area_body_entered(_body: Node2D) -> void:
		basic_attack()


func kill_self():
	queue_free()
