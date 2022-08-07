extends NinePatchRect


func _ready() -> void:
	GlobalSignals.connect("player_error_seed_zero", self, "_on_player_error_seed_zero")


func _on_player_error_seed_zero(value: bool) -> void:
	visible = value
