extends Area2D


export (NodePath) onready var limiter = get_node(limiter) as Limiter


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pick_limiter"):
		if get_overlapping_areas().size() == 0:
			return
		
		var detected_limiter : Limiter = get_overlapping_areas()[0]
		limiter.upper_limit = detected_limiter.upper_limit
		limiter.lower_limit = detected_limiter.lower_limit
		GlobalSignals.emit_signal("player_limiter_changed", limiter.lower_limit, limiter.upper_limit)
		detected_limiter.queue_free()
		
		get_tree().set_input_as_handled()
