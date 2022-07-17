extends Enemy


func reroll() -> void:
	.reroll()
	match current_roll:
		_:
			emit_signal("behaviour_changed", "do nothing")


func _physics_process(delta:float)->void:
	match current_roll:
		_: 
			do_nothing()
	data.init = false
