extends Label


var timer : SceneTreeTimer


func _ready() -> void:
	timer = get_tree().create_timer(180)
	timer.connect("timeout", self, "_on_timeout")


func _process(delta: float) -> void:
	text = str(ceil(timer.time_left))


func _on_timeout() -> void:
	GlobalSignals.emit_signal("time_over")
