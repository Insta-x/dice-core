extends Node2D


onready var dice_wrapper := $DiceWrapper


func _on_DiceWrapper_limiter_changed(lower_limit: int, upper_limit: int) -> void:
	GlobalSignals.emit_signal("player_limiter_changed", lower_limit, upper_limit)


func _on_DiceWrapper_dice_rolled(number: int) -> void:
	GlobalSignals.emit_signal("player_dice_rolled", number)


func _on_DiceWrapper_number_changed(number: int) -> void:
	GlobalSignals.emit_signal("player_number_changed", number)
