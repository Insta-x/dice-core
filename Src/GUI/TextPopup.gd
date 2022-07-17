extends Label


func _process(delta: float) -> void:
	rect_position += Vector2.UP * 30 * delta
