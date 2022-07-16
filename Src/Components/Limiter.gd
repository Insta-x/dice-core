extends Node

class_name Limiter


# Just change these, no need to extend except special case
export (int) var upper_limit := 6
export (int) var lower_limit := 0

var modulo := upper_limit - lower_limit + 1


func limit(number: int) -> int:
	return number % (modulo) + lower_limit
