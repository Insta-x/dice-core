extends NinePatchRect


const tips := [
	"Is it possible to manipulate your dice seed?",
	"I don't think it's possible to win without crits",
	"Knowing how dice core generate dice seed would be cool",
	"Don't forget... you have the hack gun",
]


func _ready() -> void:
#	randomize()
	GlobalSignals.connect("player_died", self, "_on_game_over")
	GlobalSignals.connect("time_over", self, "_on_game_over")
#	_on_game_over()


func _input(event: InputEvent) -> void:
	if visible:
		if event.is_action_pressed("pause"):
			get_tree().change_scene("res://Src/Game.tscn")
		if event.is_action_pressed("restart_tutorial"):
			get_tree().change_scene("res://Src/TestingArea.tscn")
		get_tree().set_input_as_handled()


func _on_game_over() -> void:
	$VBoxContainer/TipsLabel.text = tips[randi() % tips.size()]
	show()
