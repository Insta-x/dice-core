extends TextureRect


onready var label := $Label


func _ready() -> void:
	GlobalSignals.connect("player_health_changed", self, "_on_player_health_changed")


func _on_player_health_changed(health: int) -> void:
	label.text = health
