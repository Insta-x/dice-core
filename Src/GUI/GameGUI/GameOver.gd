extends NinePatchRect


func _ready() -> void:
	GlobalSignals.connect("player_died", self, "_on_game_over")
	GlobalSignals.connect("time_over", self, "_on_game_over")


func _input(event: InputEvent) -> void:
	if visible:
		if event.is_action_pressed("pause"):
			get_tree().change_scene("res://Src/Game.tscn")
		get_tree().set_input_as_handled()


func _on_game_over() -> void:
	show()
	$VBoxContainer/ScoreLabel.text = str(ScoreTracker.score)
