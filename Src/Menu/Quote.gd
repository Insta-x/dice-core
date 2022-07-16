extends Control


onready var screen_fader =  $ScreenFader
onready var animation_player = $AnimationPlayer
onready var continue_label = $ColorRect/CenterContainer/VBoxContainer/ContinueLabel

func _ready():
	screen_fader.fade_in()


func _input(event):
	if (event is InputEventMouseButton or event is InputEventKey):
		screen_fader.fade_out()

func _on_BlinkingTimer_timeout():
	if (continue_label.modulate == Color.white):
		continue_label.modulate = Color(0,0,0,0)
	else:
		continue_label.modulate = Color.white




func _on_ScreenFader_animation_finished(is_fade_in: int = 1):
	if (is_fade_in):
		$BlinkingTimer.start(0.7)
	else:
		get_tree().change_scene("res://Src/Player/Player.tscn")
