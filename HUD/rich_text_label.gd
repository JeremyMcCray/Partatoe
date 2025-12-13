extends RichTextLabel

func _ready():
	PlayerGlobal.gold_updated.connect(_on_picked_up_loot)

func _on_picked_up_loot(amount: int):
	text = "[right]"+ str(amount) +"[/right]"
