extends State

@export var script_user : CharacterBody2D
@export var target_name : String
var targets_left : Array
# get the list of knights
# if randknight isn't current target
# script user target = knight

func _ready():
	target_name = get_parent().target_name
	pass

func Enter():
	choose_enemy_or_wait()

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	choose_enemy_or_wait()
	pass

func choose_enemy_or_wait():
	if script_user.target != null:
		return

	targets_left = PlayerGlobal.party

	for new_target in targets_left:
		if script_user.target != new_target:
			script_user.target = new_target
			transitioned.emit(self,"Follow_enemy")
