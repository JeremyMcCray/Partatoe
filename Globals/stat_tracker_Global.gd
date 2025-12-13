extends Node

func _ready():
	#Connect to all stat signals
		PlayerGlobal.gold_updated.connect(update_stats)
		
func update_stats():
	#maybe add to dictionary? update UI information
	pass

#Kill Count
#Damage dealt?
#Heal healed?
#Waves beaten
#Gold collected
