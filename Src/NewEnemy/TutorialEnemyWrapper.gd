extends EnemyWrapper


func dead() -> void:
	.dead()
	GlobalSignals.emit_signal("batu_died")
