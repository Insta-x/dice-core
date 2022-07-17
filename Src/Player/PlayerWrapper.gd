extends Node2D


onready var dice_wrapper := $DiceWrapper


func _ready() -> void:
	GlobalSignals.connect("time_over", self, "game_over")


func _on_DiceWrapper_dice_rolled(number: int) -> void:
	GlobalSignals.emit_signal("player_dice_rolled", number)


func _on_DiceWrapper_dice_core_changed(resource: DiceCoreResource) -> void:
	GlobalSignals.emit_signal("player_dice_changed", resource)


func _on_DiceWrapper_limiter_changed(lower_limit: int, upper_limit: int) -> void:
	GlobalSignals.emit_signal("player_limiter_changed", lower_limit, upper_limit)


func _on_DiceWrapper_number_changed(number: int) -> void:
	GlobalSignals.emit_signal("player_number_changed", number)


func _on_HazardDetector_area_entered(area: Area2D) -> void:
	OS.delay_msec(500)
	game_over()
	hide()
	$PlayerDIedSFX.play()
	GlobalSignals.emit_signal("player_died")


func game_over() -> void:
	$Player.set_physics_process(false)
	$Player/PlayerHazardDetector/CollisionShape2D.set_deferred("disabled", true)
