extends Control

var party_member : CharacterBody2D

var kill_count = 0

func sub():
	party_member.took_damage.connect(_on_took_damage)
	party_member.heal_s.connect(_on_heal)
	party_member.killed.connect(on_kill)
	$HealthBar.value = party_member.health_points
	$Name.text = party_member.knight_name

func _on_took_damage(_amount: int):
	$HealthBar.value = party_member.health_points

func _on_heal(_amount: int):
	$HealthBar.value = party_member.health_points

func on_kill():
	kill_count += 1
	$KillCounterText/KillCounterNumb.text = str(kill_count)
