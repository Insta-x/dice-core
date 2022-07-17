extends Enemy


func rolldone() -> void:
	.rolldone()
	match current_roll:
		0, 6:
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
		0, 10,20:
			self_destruct()
		1,5,9,13,17:
			move_near_player()
		2,6,14,18:
			move_random()
		3,7,11,15,19:
			$AnimationPlayer.play("Shoot")
			shoot()
		4,8,12,16:
			avoid_player()
		_: 
			do_nothing()
	data.init = false

func set_health(value: int) -> void:
	$Sprite.material.set_shader_param("flash_modifier",1)
	$Sprite2.material.set_shader_param("flash_modifier",1)
	$Sprite3.material.set_shader_param("flash_modifier",1)
	$ShaderTimer.start()
	.set_health(value)


func _on_AnimationPlayer_animation_finished(anim_name: String):
	if (anim_name == "Shoot"):
		shoot()
		$AnimationPlayer.play("Shoot-2")
	


func _on_ShaderTimer_timeout():
	$Sprite.material.set_shader_param("flash_modifier",0)
	$Sprite2.material.set_shader_param("flash_modifier",0)
	$Sprite3.material.set_shader_param("flash_modifier",0)
