extends TextureProgress


export (NodePath) onready var timer = get_node(timer) as Timer


func _process(delta: float) -> void:
	if timer:
		value = (timer.wait_time - timer.time_left) / timer.wait_time * max_value
