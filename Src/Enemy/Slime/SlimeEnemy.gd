extends Enemy


func rolldone() -> void:
	.rolldone()
	match current_roll:
		0,10,20:
			emit_signal("behaviour_changed", "self destruct")
		1,4,7,9,10,11,13,16,19:
			emit_signal("behaviour_changed", "move to player")
		2,5,8,12,15,18:
			emit_signal("behaviour_changed", "move random")
		_:
			emit_signal("behaviour_changed", "do nothing")


func _physics_process(delta:float)->void:
	match current_roll:
		0,10,20:
			self_destruct()
		1,4,7,9,10,11,13,16,19:
			move_to_player()
		2,5,8,12,15,18:
			move_random()
		_: 
			do_nothing()
	data.init = false

func set_health(value: int) -> void:
	$Sprite.material.set_shader_param("flash_modifier",1)
	$ShaderTimer.start()
	.set_health(value)


func _on_ShaderTimer_timeout():
	$Sprite.material.set_shader_param("flash_modifier",0)
	pass # Replace with function body.
