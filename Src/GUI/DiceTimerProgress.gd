extends TextureProgress


export (NodePath) onready var timer = get_node(timer) as Timer
export (float) var offset := 0.0


func _process(delta: float) -> void:
	if timer:
		var temp : float = (timer.wait_time - timer.time_left) / timer.wait_time * max_value + offset
		value = temp + max_value if temp < 0 else temp - max_value if temp > max_value else temp
