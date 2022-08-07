extends Node

class_name EnemyHealth


export (NodePath) onready var body = get_node(body) as NewEnemy
export (NodePath) onready var dice_wrapper = get_node(dice_wrapper) as DiceWrapper

export (int) var max_health = 3
export (int) var crit_damage := 3
export (bool) var immune_to_more = false
export (bool) var immune_to_less = false
export (bool) var immune_to_same = false
export (bool) var immune_to_even = false
export (bool) var immune_to_odd = false
export (bool) var weak_to_same = true

signal health_changed(new_health)
signal number_changed(new_number)
signal died

var health = max_health setget set_health
var current_number := 0 setget set_current_number
var is_dead := false


func _ready() -> void:
	self.health = max_health
	self.current_number = dice_wrapper.get_number(false)


func hurt(roll: int) -> void:
	if immune_to_more and roll > current_number:
		GlobalSignals.emit_signal("text_popup", "immune to higher", body.global_position)
		return

	if immune_to_less and roll < current_number:
		GlobalSignals.emit_signal("text_popup", "immune to lower", body.global_position)
		return

	if immune_to_same and roll == current_number:
		GlobalSignals.emit_signal("text_popup", "immune to equal", body.global_position)
		return

	if immune_to_even and roll % 2 == 0:
		GlobalSignals.emit_signal("text_popup", "immune to even", body.global_position)
		return

	if immune_to_odd and roll % 2 == 1:
		GlobalSignals.emit_signal("text_popup", "immune to odd", body.global_position)
		return
	
	if weak_to_same and roll == current_number:
		self.health -= crit_damage
		GlobalSignals.emit_signal("critical_hit")
		GlobalSignals.emit_signal("text_popup", "CRIT", body.global_position)
		return
	
	self.health -= 1


func set_health(value: int) -> void:
	health = clamp(value, 0, max_health)
	emit_signal("health_changed", health)
	
	if health <= 0 and not is_dead:
		emit_signal("died")
		is_dead = true


func set_current_number(value: int) -> void:
	current_number = value
	emit_signal("number_changed", current_number)


func _on_DiceWrapper_number_generated(number: int) -> void:
	yield(get_tree().create_timer(0.9), "timeout")
	self.current_number = number
