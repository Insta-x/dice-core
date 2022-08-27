extends EnemyWrapper


func customprocess() -> void:
	if iter == 0:
		dice_behaviour_machine.new_behaviour(1)
	elif iter == 10:
		dice_behaviour_machine.new_behaviour(2)
