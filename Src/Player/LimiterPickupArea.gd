extends Area2D


export (NodePath) onready var dice_wrapper = get_node(dice_wrapper) as DiceWrapper

signal limiter_picked(lower_limit, upper_limit)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pick_limiter"):
		if get_overlapping_areas().size() == 0:
			return
		
		var detected_limiter : PickupableLimiter = get_overlapping_areas()[0]
		dice_wrapper.set_new_limit(detected_limiter.lower_limit, detected_limiter.upper_limit)
		detected_limiter.queue_free()
		
		get_tree().set_input_as_handled()
