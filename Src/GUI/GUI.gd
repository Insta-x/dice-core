extends Control


func _ready() -> void:
	GlobalSignals.connect("player_died", self, "hide")
	GlobalSignals.connect("time_over", self, "hide")
