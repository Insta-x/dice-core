extends EnemyWrapper


func customprocess() -> void:
	if iter == 0:
		dice_behaviour_machine.new_behaviour(1)
	elif iter == 1:
		dice_behaviour_machine.new_behaviour(2)
