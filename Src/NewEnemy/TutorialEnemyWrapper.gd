extends EnemyWrapper


func hacked(hack_seed: int) -> void:
	.hacked(hack_seed)
	
	if hack_seed == 6:
		GlobalSignals.emit_signal("tutorial_complete")


func show_gui() -> void:
	$GUIwrapper/EnemyGUI/VBoxContainer/HBoxContainer/MarginContainer/HealthContainer/ResultNumber.show()
	$GUIwrapper/EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer.show()
	$GUIwrapper/EnemyGUI/VBoxContainer/DiceTimerProgress.show()
