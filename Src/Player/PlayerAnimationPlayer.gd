extends AnimationPlayer


func _ready() -> void:
	GlobalSignals.connect("critical_hit", self, "_on_critical_hit")


func _on_Player_shoot_input() -> void:
	play("Shoot")


func _on_critical_hit() -> void:
	stop()
