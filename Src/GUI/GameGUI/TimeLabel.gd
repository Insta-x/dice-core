extends Label


var timer : SceneTreeTimer


func _ready() -> void:
	GlobalSignals.connect("batu_died", self, "start_timer")

func start_timer() -> void:
	timer = get_tree().create_timer(100)
	timer.connect("timeout", self, "_on_timeout")


func _process(delta: float) -> void:
	if timer:
		text = str(ceil(timer.time_left))


func _on_timeout() -> void:
	GlobalSignals.emit_signal("time_over")
