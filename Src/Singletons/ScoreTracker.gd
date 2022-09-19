extends Node


signal score_changed(score)
signal score_win()

var score := 0 setget set_score
var win_score := 20


func set_score(value: int) -> void:
	score = value
	emit_signal("score_changed", score)
	
	if score >= win_score:
		emit_signal("score_win")
