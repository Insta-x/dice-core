extends Area2D


export (NodePath) onready var dice_wrapper = get_node(dice_wrapper) as DiceWrapper

signal indexer_picked(start)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pick_indexer"):
		if get_overlapping_areas().size() == 0:
			return
		get_parent().get_parent().get_node("PickUpSFX").play()
		var detected_indexer : PickupableIndexer = get_overlapping_areas()[0]
		dice_wrapper.set_new_indexer(detected_indexer.start)
		detected_indexer.queue_free()
		
		get_tree().set_input_as_handled()


func _on_IndexerPickupArea_area_entered(area: Area2D) -> void:
	area.show_prompt()


func _on_IndexerPickupArea_area_exited(area: Area2D) -> void:
	area.hide_prompt()
