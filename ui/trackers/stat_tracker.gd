extends VBoxContainer

@export var max_health_tracker: RichTextLabel
@export var bonus_damage_tracker: RichTextLabel
@export var attack_speed_tracker: RichTextLabel
@export var attack_range_tracker: RichTextLabel
@export var move_speed_tracker: RichTextLabel
@export var health_regen_tracker: RichTextLabel
@export var party_size_tracker: RichTextLabel

func _ready() -> void:
	PlayerGlobal.max_health_updated.connect(max_health_tracker.update_message)
	PlayerGlobal.bonus_damage_updated.connect(bonus_damage_tracker.update_message)
	PlayerGlobal.attack_speed_updated.connect(attack_speed_tracker.update_message)
	PlayerGlobal.attack_range_updated.connect(attack_range_tracker.update_message)
	PlayerGlobal.move_speed_updated.connect(move_speed_tracker.update_message)
	PlayerGlobal.health_regen_updated.connect(health_regen_tracker.update_message)
	PlayerGlobal.party_size_updated.connect(party_size_tracker.update_message)
	
	PlayerGlobal.max_health_updated.emit(PlayerGlobal.max_health)
	PlayerGlobal.bonus_damage_updated.emit(PlayerGlobal.bonus_damage)
	PlayerGlobal.attack_speed_updated.emit(PlayerGlobal.attack_speed)
	PlayerGlobal.attack_range_updated.emit(PlayerGlobal.attack_range)
	PlayerGlobal.move_speed_updated.emit(PlayerGlobal.move_speed)
	PlayerGlobal.health_regen_updated.emit(PlayerGlobal.health_regen)
	PlayerGlobal.party_size_updated.emit(PlayerGlobal.party_size)
