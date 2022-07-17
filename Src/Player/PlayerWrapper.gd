extends Node2D


func _on_DiceCore_dice_rolled(number: int) -> void:
	GlobalSignals.emit_signal("player_dice_rolled", number)
