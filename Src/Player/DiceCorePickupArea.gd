extends Area2D


export (NodePath) onready var dice_wrapper = get_node(dice_wrapper) as DiceWrapper

signal dice_core_picked(dice_core_resource)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pick_dice_core"):
		if get_overlapping_areas().size() == 0:
			return
		get_parent().get_parent().get_node("PickUpSFX").play()
		var detected_dice_core : PickupableDiceCore = get_overlapping_areas()[0]
		dice_wrapper.set_new_dice_core(detected_dice_core.dice_core_resource)
		detected_dice_core.queue_free()
		
		get_tree().set_input_as_handled()
