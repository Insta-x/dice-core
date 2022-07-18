extends Node

class_name EnemyHealth


export (NodePath) onready var body_position = get_node(body_position) as Position2D
export (NodePath) onready var dice_wrapper = get_node(dice_wrapper) as DiceWrapper

export (int) var max_health = 3
export (int) var crit_damage := 3
export (bool) var immune_to_more = false
export (bool) var immune_to_less = false
export (bool) var immune_to_same = false
export (bool) var immune_to_even = true
export (bool) var immune_to_odd = false
export (bool) var weak_to_same = true

signal health_changed
signal died

var health = max_health setget set_health


func _ready() -> void:
	self.health = max_health


func hurt(roll: int) -> void:
	var current_roll : int = dice_wrapper.get_number(false)
	
	if immune_to_more and roll > current_roll:
		GlobalSignals.emit_signal("text_popup", "immune to higher", body_position.global_position)
		return

	if immune_to_less and roll < current_roll:
		GlobalSignals.emit_signal("text_popup", "immune to lower", body_position.global_position)
		return

	if immune_to_same and roll == current_roll:
		GlobalSignals.emit_signal("text_popup", "immune to equal", body_position.global_position)
		return

	if immune_to_even and roll % 2 == 0:
		GlobalSignals.emit_signal("text_popup", "immune to even", body_position.global_position)
		return

	if immune_to_odd and roll % 2 == 1:
		GlobalSignals.emit_signal("text_popup", "immune to odd", body_position.global_position)
		return
	
	if weak_to_same and roll == current_roll:
		self.health -= crit_damage
		return
	
	self.health -= 1


func set_health(value: int) -> void:
	health = clamp(value, 0, max_health)
	emit_signal("health_changed", value)
	
	if health <= 0:
		emit_signal("died")