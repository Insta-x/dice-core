extends TextureProgress


export (NodePath) onready var timer = get_node(timer) as Timer


func _process(delta: float) -> void:
	# Assume timer start from 3s
	value = (3 - $DiceTimer.time_left) * 50
