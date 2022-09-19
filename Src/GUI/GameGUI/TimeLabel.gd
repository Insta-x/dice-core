extends Label


export (NodePath) onready var timer = get_node(timer) as Timer


func _process(delta: float) -> void:
	if timer:
		text = str(ceil(timer.time_left))
