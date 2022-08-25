extends Node

class_name Limiter


export (int) var limit := 3 setget set_limit


func limit(number: int) -> int:
	return number % limit


func set_limit(value: int) -> void:
	limit = value
