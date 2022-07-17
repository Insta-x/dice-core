extends Enemy


func reroll() -> void:
	.reroll()


func _physics_process(delta:float)->void:
	match current_roll:
		0:
			self_destruct()
		1:
			move_to_player()
		2:
			move_random()
		_: 
			do_nothing()
	data.init = false
