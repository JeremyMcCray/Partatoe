extends RichTextLabel

var gold_total = 0

func _ready():
	PlayerGlobal.pick_up_gold.connect(_on_picked_up_loot)

func _on_picked_up_loot(amount:int):
	gold_total += amount
	text = "[right]"+ str(gold_total) +"[/right]"
