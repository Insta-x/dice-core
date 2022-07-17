extends Node2D


onready var dice_wrapper := $DiceWrapper


func _on_DiceWrapper_dice_rolled(number: int) -> void:
	$DiceRollSFX.play()
	GlobalSignals.emit_signal("player_dice_rolled", number)


func _on_DiceWrapper_dice_core_changed(resource: DiceCoreResource) -> void:
	GlobalSignals.emit_signal("player_dice_changed", resource)


func _on_DiceWrapper_limiter_changed(lower_limit: int, upper_limit: int) -> void:
	GlobalSignals.emit_signal("player_limiter_changed", lower_limit, upper_limit)


func _on_DiceWrapper_number_changed(number: int) -> void:
	GlobalSignals.emit_signal("player_number_changed", number)


func _on_HazardDetector_area_entered(area: Area2D) -> void:
	OS.delay_msec(500)
	hide()
	$PlayerDIedSFX.play()
	$Player.set_physics_process(false)
	GlobalSignals.emit_signal("player_died")
