extends State

@export var script_user : CharacterBody2D

func _ready():
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
	script_user.target = PlayerGlobal.get_player()
	transitioned.emit(self,"Follow_enemy")
