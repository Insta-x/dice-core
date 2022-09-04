extends CenterContainer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().set_input_as_handled()
	
	if event.is_action_pressed("ui_accept"):
		GlobalSignals.emit_signal("dice_set_selected")
		queue_free()
		
		get_tree().set_input_as_handled()
