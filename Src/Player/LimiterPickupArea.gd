extends Area2D


export (NodePath) onready var dice_wrapper = get_node(dice_wrapper) as DiceWrapper

signal limiter_picked(limit)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pick_limiter"):
		if get_overlapping_areas().size() == 0:
			return
		get_parent().get_parent().get_node("PickUpSFX").play()
		var detected_limiter : PickupableLimiter = get_overlapping_areas()[0]
		dice_wrapper.set_new_limit(detected_limiter.limit)
		detected_limiter.queue_free()
		
		get_tree().set_input_as_handled()


func _on_LimiterPickupArea_area_entered(area: PickupableLimiter) -> void:
	area.show_prompt()


func _on_LimiterPickupArea_area_exited(area: PickupableLimiter) -> void:
	area.hide_prompt()
