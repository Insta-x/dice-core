extends Control


func _on_DiceCore_dice_rolled(number: int) -> void:
	$HBoxContainer/HBoxContainer/DiceCore/RollLabel.roll(number)
