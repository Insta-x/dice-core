extends Node

class_name DiceCore


export (int) var init_number := 1
export (Texture) var dice_icon
export (NodePath) onready var limiter = get_node(limiter) as Limiter

var current_number := init_number


func _next() -> int:
	var new_number = current_number * 3
	current_number = limiter.limit(new_number)
	return current_number
