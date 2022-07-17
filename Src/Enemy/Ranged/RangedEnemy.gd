extends Enemy


func reroll() -> void:
	.reroll()
	match current_roll:
		0:
			emit_signal("behaviour_changed", "self destruct")
		1:
			emit_signal("behaviour_changed", "move near player")
		2:
			emit_signal("behaviour_changed", "move random")
		3:
			emit_signal("behaviour_changed", "shoot")
		4:
			emit_signal("behaviour_changed", "avoid player")
		_:
			emit_signal("behaviour_changed", "do nothing")


func _physics_process(delta: float) -> void:
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
