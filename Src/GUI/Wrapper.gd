extends Node2D

func _on_health_changed(value: int) -> void:
	$EnemyGUI/HBoxContainer/Health/Label.text = str(value)
	
func _on_DiceWrapper_dice_rolled(number: int) -> void:
	$EnemyGUI/HBoxContainer/HBoxContainer/DiceCore/RollLabel.roll(number)


func _on_DiceWrapper_limiter_changed(lower_limit: int, upper_limit: int) -> void:
	$EnemyGUI/HBoxContainer/HBoxContainer/LowerLimit/Label.text = str(lower_limit)
	$EnemyGUI/HBoxContainer/HBoxContainer/UpperLimit/Label.text = str(upper_limit)


func _on_DiceWrapper_number_changed(number: int) -> void:
	$EnemyGUI/HBoxContainer/HBoxContainer/DiceCore/RollLabel.change_number(number)


func _physics_process(delta:float)->void:
	global_rotation = 0
