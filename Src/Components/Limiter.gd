extends Node

class_name Limiter


export (int) var modulo := 7


func limit(number: int) -> int:
	return number % modulo
