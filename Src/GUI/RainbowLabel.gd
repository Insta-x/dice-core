extends Label


export (float) var duration := 1


func _process(delta: float) -> void:
	self_modulate.h += 1 / duration * delta
