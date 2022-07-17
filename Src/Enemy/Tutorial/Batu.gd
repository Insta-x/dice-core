extends Enemy

func _physics_process(delta:float)->void:
	match current_roll:
		_: 
			do_nothing()
	data.init = false
