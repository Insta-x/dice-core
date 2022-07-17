extends Node2D


onready var dice_wrapper := $DiceWrapper


func _on_DiceWrapper_limiter_changed(lower_limit, upper_limit) -> void:
	GlobalSignals.emit_signal("player_limiter_changed", lower_limit, upper_limit)
	GlobalSignals.emit_signal("player_number_changed", dice_wrapper.get_number(false))


func _on_DiceWrapper_dice_rolled(number) -> void:
	GlobalSignals.emit_signal("player_dice_rolled", number)
