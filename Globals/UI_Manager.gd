extends Node

signal on_item_viewed(item_info)

var viewed_item: Item:
	set(new_item):
		viewed_item = new_item
		
		if new_item == null:
			on_item_viewed.emit("")
		else:
			on_item_viewed.emit(viewed_item.get_view())

func clear_item_view() -> void:
	viewed_item = null
