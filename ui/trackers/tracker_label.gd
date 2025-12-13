extends RichTextLabel

@export var default_message: String

func update_message(value) -> void:
	text = default_message + ': ' + str(value)
