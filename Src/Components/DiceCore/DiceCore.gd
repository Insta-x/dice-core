extends Node

class_name DiceCore


export (int) var init_number := 1
export (Texture) var dice_icon
export (NodePath) onready var limiter = get_node(limiter) as Limiter

signal dice_rolled

var current_number := init_number


func get_number(next: bool = true) -> int:
	var result : int = limiter.limit(current_number)
	if next:
		next()
	return result


func next() -> void:
	current_number = _formula(current_number) % limiter.modulo
	emit_signal("dice_rolled", current_number)


# Override for different DiceCore
func _formula(number: int) -> int:
	return number + 1
