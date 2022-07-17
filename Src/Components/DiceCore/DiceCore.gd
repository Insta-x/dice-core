extends Node

class_name DiceCore


export (int) var init_number := 1
export (Texture) var dice_icon

signal dice_rolled(number)

var current_number := init_number


func next(modulo: int) -> void:
	current_number = _formula(current_number) % modulo
	emit_signal("dice_rolled", current_number)


# Override for different DiceCore
func _formula(number: int) -> int:
	return number + 1
