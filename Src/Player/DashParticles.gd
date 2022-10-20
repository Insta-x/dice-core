extends CPUParticles2D


func _ready() -> void:
	GlobalSignals.connect("player_dashed", self, "emit")


func emit(dash_dir: Vector2) -> void:
	direction = -dash_dir
	restart()
