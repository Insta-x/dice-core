extends Node


export (PoolStringArray) var block_press := []
export (PoolStringArray) var block_release := []


func _unhandled_input(event: InputEvent) -> void:
	for block in block_press:
		if event.is_action_pressed(block):
			get_tree().set_input_as_handled()
	
	for block in block_release:
		if event.is_action_released(block):
			get_tree().set_input_as_handled()
