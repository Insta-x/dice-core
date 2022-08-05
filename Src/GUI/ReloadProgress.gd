extends TextureProgress


onready var tween := $Tween


func _ready() -> void:
	GlobalSignals.connect("player_shot", self, "reset_progress")
	GlobalSignals.connect("critical_hit", self, "_on_critical_hit")


func reset_progress() -> void:
	tween.interpolate_property(self, "value", max_value, min_value, 1.9, Tween.TRANS_LINEAR)
	tween.start()


func _on_critical_hit() -> void:
	tween.stop_all()
	value = min_value
