extends Node

class_name DiceCore


export (int) var init_seed := 1
export (Resource) var dice_core_resource = dice_core_resource as DiceCoreResource

signal dice_seed_init(init_seed)
signal dice_rolled(next_seed, limited_seed)

onready var current_seed := init_seed setget set_current_seed


func ready_seed(ready_seed: int) -> void:
	current_seed = ready_seed
	emit_signal("dice_seed_init", current_seed)


func roll(modulo: int) -> void:
	var next_seed := get_next_seed()
	self.current_seed = next_seed % modulo
#	print("ROLL ", next_seed, ' ', current_seed)
	emit_signal("dice_rolled", next_seed, current_seed)


func get_next_seed() -> int:
	return dice_core_resource._formula(current_seed)


func set_current_seed(value: int) -> void:
	current_seed = value
