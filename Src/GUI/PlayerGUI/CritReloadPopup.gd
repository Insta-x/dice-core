extends NinePatchRect


onready var tween := $Tween


func _ready() -> void:
	GlobalSignals.connect("critical_hit", self, "_on_critical_hit")


func _on_critical_hit() -> void:
	tween.stop_all()
	
	show()
	tween.interpolate_property(
		self, "modulate",
		Color.white, Color(1.0, 1.0, 1.0, 0.5), 0.7,
		Tween.TRANS_CUBIC, Tween.EASE_IN
	)
	tween.start()


func _on_Tween_tween_all_completed() -> void:
	hide()
