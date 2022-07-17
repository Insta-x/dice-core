extends Enemy


func rolldone() -> void:
	.rolldone()
	match current_roll:
		0:
			emit_signal("behaviour_changed", "self destruct")
		1:
			$AnimatedSprite.playing = true
			emit_signal("behaviour_changed", "move to player")
		2:
			$AnimatedSprite.playing = true
			emit_signal("behaviour_changed", "move random")
		_:
			$AnimatedSprite.frame = 0
			$AnimatedSprite.playing = false
			emit_signal("behaviour_changed", "do nothing")


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
