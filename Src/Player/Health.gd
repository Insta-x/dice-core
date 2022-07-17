extends Node


var health := 1 setget set_health


func set_health(value: int) -> void:
	health = value
	GlobalSignals.emit_signal("player_health_changed", health)
