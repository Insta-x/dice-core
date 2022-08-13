extends Node

class_name Indexer


export (int) var start := 0


func index(number: int) -> int:
	return (number + start) % 20
