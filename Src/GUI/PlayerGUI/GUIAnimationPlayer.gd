extends AnimationPlayer


func _ready() -> void:
	GlobalSignals.connect("critical_hit", self, "_on_critical_hit")


func _on_DiceCoreLabel_random_finished() -> void:
	play("RESET")
	queue("ResultNumber")


func _on_critical_hit() -> void:
	play("RESET")
