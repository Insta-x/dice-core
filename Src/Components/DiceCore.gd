extends Node

class_name DiceCore


export (int) var current_number := 1


func _next() -> int:
	var new_number = current_number
	current_number = new_number
	return current_number
