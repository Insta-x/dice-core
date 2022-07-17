extends Node

class_name DiceWrapper


signal dice_rolled(number)
signal limiter_changed(lower_limit, upper_limit)

onready var dice_core : DiceCore = $DiceCore
onready var limiter : Limiter = $Limiter


func get_number(next: bool = true) -> int:
	var result : int = limiter.limit(dice_core.current_number)
	if next:
		dice_core.next(limiter.modulo)
		emit_signal("dice_rolled", get_number(false))
	return result


func set_new_limit(lower_limit: int, upper_limit: int) -> void:
	limiter.lower_limit = lower_limit
	limiter.upper_limit = upper_limit
	emit_signal("limiter_changed", lower_limit, upper_limit)
