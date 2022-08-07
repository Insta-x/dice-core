extends DiceCoreLabel


func _ready() -> void:
	GlobalSignals.connect("critical_hit", self, "_on_critical_hit")


func _on_critical_hit() -> void:
	timer.stop()
	show_true_seed()
