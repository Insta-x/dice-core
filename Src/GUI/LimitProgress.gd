extends TextureProgress


onready var tween := $Tween


func _ready() -> void:
	GlobalSignals.connect("player_hack_shot", self, "reset_progress")


func reset_progress() -> void:
	tween.interpolate_property(self, "value", max_value, min_value, 1, Tween.TRANS_LINEAR)
	tween.start()
