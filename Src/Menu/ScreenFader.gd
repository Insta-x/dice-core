extends TextureRect

var is_playing := false
onready var tween = $Tween


signal animation_finished


func fade_in(duration : float = 1.0) -> void:
	tween.interpolate_property(
		self,
		"modulate",
		modulate,
		Color(1, 1, 1, 0),
		duration,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT,
		0
	)
	show()
	tween.start()
	is_playing = true


func fade_out(duration : float = 1.0) -> void:
	tween.interpolate_property(
		self,
		"modulate",
		modulate,
		Color.white,
		duration,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT,
		0
	)
	show()
	tween.start()
	is_playing = true

func _on_Tween_tween_completed(_object: Object, _key: NodePath) -> void:
	is_playing = false
	if modulate == Color(1, 1, 1, 0):
		hide()
	emit_signal("animation_finished",modulate == Color(1,1,1,0))
