extends Node

class_name Limiter


# Just change these, no need to extend except special case
export (int) var upper_limit := 6 setget set_upper_limit
export (int) var lower_limit := 0 setget set_lower_limit

var modulo := upper_limit - lower_limit + 1


func limit(number: int) -> int:
	return number % modulo + lower_limit


func set_upper_limit(value: int) -> void:
	upper_limit = value
	modulo = upper_limit - lower_limit + 1


func set_lower_limit(value: int) -> void:
	lower_limit = value
	modulo = upper_limit - lower_limit + 1
