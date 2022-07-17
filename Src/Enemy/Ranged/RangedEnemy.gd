extends Enemy

func _physics_process(delta:float)->void:
	match current_roll:
		0:
			self_destruct()
		1:
			move_near_player()
		2:
			move_random()
		3:
			shoot()
		4:
			avoid_player()
		_: 
			do_nothing()
	data.init = false
