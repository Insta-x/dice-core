extends Enemy

func _ready():
	is_batu = true

func rolldone() -> void:
	.rolldone()
	match current_roll:
		_:
			emit_signal("behaviour_changed", "do nothing")


func _physics_process(delta:float)->void:
	match current_roll:
		_:
			do_nothing()
	data.init = false


func modifhit() -> void:
	.reroll()
	
func set_health(value: int) -> void:
	$Sprite.material.set_shader_param("flash_modifier",1)
	$ShaderTimer.start()
	.set_health(value)


func _on_ShaderTimer_timeout():
	$Sprite.material.set_shader_param("flash_modifier",0)
