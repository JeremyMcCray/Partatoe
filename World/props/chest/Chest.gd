extends Area2D

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D

@export var item: Item

var looted: bool = false

func _on_body_entered(body):
	if item != null:
		UiManager.viewed_item = item
		body.interactable = self
	
	#if looted == false:
		#looted = true
		#collision.set_deferred("disabled", true)
		#sprite.frame = 8

func _on_body_exited(body: Node2D) -> void:
	if UiManager.viewed_item == item:
		UiManager.clear_item_view()
	
	if body.interactable == self:
		body.interactable = null

func use():
	if item != null:
		if item.buy():
			sprite.frame = 8
