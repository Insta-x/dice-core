extends Node

class_name DiceCore


export (int) var init_number := 1
export (Resource) var dice_core_resource = dice_core_resource as DiceCoreResource

signal dice_rolled(number)

var current_number := init_number


func next(modulo: int) -> void:
	current_number = dice_core_resource._formula(current_number) % modulo
	emit_signal("dice_rolled", current_number)

