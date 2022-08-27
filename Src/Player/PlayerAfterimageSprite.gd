extends Sprite


onready var tween := $Tween


func _ready() -> void:
	tween.interpolate_property(
		self, "modulate:a",
		modulate.a, 0.1,
		0.3
	)
	tween.start()


func _on_Tween_tween_all_completed() -> void:
	queue_free()
