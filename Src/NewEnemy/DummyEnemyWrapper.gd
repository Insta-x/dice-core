extends EnemyWrapper


func hacked(hack_seed: int) -> void:
	.hacked(hack_seed)
	
	if hack_seed == 6:
		GlobalSignals.emit_signal("tutorial_complete")
