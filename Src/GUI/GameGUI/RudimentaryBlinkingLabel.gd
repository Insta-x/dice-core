extends Label


export (bool) var is_blinking := true


func _ready() -> void:
	while is_blinking:
		yield(get_tree().create_timer(0.1), "timeout")
		modulate.a = 1.0
		yield(get_tree().create_timer(1.0), "timeout")
		modulate.a = 0.75

