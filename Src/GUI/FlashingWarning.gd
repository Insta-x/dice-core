extends NinePatchRect


func _ready() -> void:
	GlobalSignals.connect("player_warning_limiter", self, "_on_player_warning_limiter")


func _on_player_warning_limiter(value: bool) -> void:
	visible = value
