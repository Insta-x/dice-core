extends Node


export (float) var max_alpha := 1.0
export (float) var min_alpha := 0.5

var high := true


func _ready() -> void:
	owner.modulate.a = max_alpha


func _on_Timer_timeout() -> void:
	owner.modulate.a = min_alpha if high else max_alpha
	high = not high
