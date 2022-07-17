extends Control


func _on_health_changed(value: int) -> void:
	$HBoxContainer/Health/Label.text = str(value)


func _on_DiceCore_dice_rolled(number: int) -> void:
	$HBoxContainer/HBoxContainer/DiceCore/RollLabel.roll(number)


func _on_Limiter_upper_limit_changed(new_limit: int) -> void:
	$HBoxContainer/HBoxContainer/UpperLimit/Label.text = str(new_limit)


func _on_Limiter_lower_limit_changed(new_limit: int) -> void:
	$HBoxContainer/HBoxContainer/LowerLimit/Label.text = str(new_limit)
