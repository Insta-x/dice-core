extends Camera2D


var shake_time_left := 0.0
var shake_total_time := 0.0
var strength := 0


func _ready() -> void:
	GlobalSignals.connect("player_shot", self, "shake")


func _process(delta: float) -> void:
	shake_time_left = move_toward(shake_time_left, 0.0, delta)
	
	# Shakes
	if shake_time_left > 0.01:
		var damping := ease(shake_time_left / shake_total_time, 1.0)
		offset = Vector2(
			randi() % strength * damping,
			randi() % strength * damping
			)


func shake(duration : float = 0.1, power : int = 20) -> void:
	shake_time_left = duration
	shake_total_time = duration
	strength = power
