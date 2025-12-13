extends NinePatchRect

@onready var item_view = $RichTextLabel

func _ready() -> void:
	UiManager.on_item_viewed.connect(update_item_view)

func update_item_view(new_text: String) -> void:
	if new_text == "":
		self.hide()
	else:
		self.show()
	
	item_view.text = new_text
