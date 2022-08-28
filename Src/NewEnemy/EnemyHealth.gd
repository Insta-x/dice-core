extends Node

class_name EnemyHealth


const crit_damage := 3

export (NodePath) onready var body = get_node(body) as NewEnemy
export (NodePath) onready var dice_wrapper = get_node(dice_wrapper) as DiceWrapper
export (int) var init_number := -1

export (int) var max_health = 3

signal health_changed(new_health)
signal number_changed(new_number)
signal died
signal enemy_hurt

var health = max_health setget set_health
var current_number := 0 setget set_current_number
var is_dead := false


func _ready() -> void:
	self.health = max_health
	self.current_number = randi() % 10 if init_number == -1 else init_number


func hurt(roll: int) -> void:
	emit_signal("enemy_hurt")
	
	if roll == current_number:
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
