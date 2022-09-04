extends TextureButton


var limit := 0 setget set_limit


func _toggled(button_pressed: bool) -> void:
	if button_pressed:
		GlobalSignals.emit_signal("limiter_selected", limit)


func init(init_limit: int) -> void:
	self.limit = init_limit
	
	if pressed:
		GlobalSignals.emit_signal("limiter_selected", limit)


func set_limit(value: int) -> void:
	limit = value
	$Label.text = str(limit)
