extends Label


func _ready() -> void:
	ScoreTracker.connect("score_changed", self, "_on_score_changed")


func _on_score_changed(value: int) -> void:
	text = str(value)
