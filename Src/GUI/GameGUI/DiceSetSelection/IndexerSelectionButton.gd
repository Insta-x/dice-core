extends TextureButton


var start := 0 setget set_start


func _toggled(button_pressed: bool) -> void:
	if button_pressed:
		GlobalSignals.emit_signal("indexer_selected", start)


func init(init_start: int) -> void:
	self.start = init_start
	
	if pressed:
		GlobalSignals.emit_signal("indexer_selected", start)


func set_start(value: int) -> void:
	start = value
	$Label.text = str(start)
