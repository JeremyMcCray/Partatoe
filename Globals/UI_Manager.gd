extends Node

signal on_item_viewed(item_info)

func clear_item_view() -> void:
	on_item_viewed.emit("")
