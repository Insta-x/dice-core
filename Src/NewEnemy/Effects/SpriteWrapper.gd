extends Node2D


func blink():
	for i in range(3):
		for child in get_children():
			child.material.set_shader_param("flash_modifier",1)
		yield(get_tree().create_timer(0.02),"timeout")
		for child in get_children():
			child.material.set_shader_param("flash_modifier",0)
		yield(get_tree().create_timer(0.02),"timeout")
	
