extends Node


onready var gui := $CanvasLayer/GUI
onready var tutorial_label := $CanvasLayer/TutorialLabel


func _ready() -> void:
	gui.set_dice_visibility(false)
	gui.set_hack_visibility(false)
	yield(get_tree().create_timer(2), "timeout")
	sequence_one()


func sequence_one() -> void:
	tutorial_label.display_text("Use mouse to aim\nPress LMB to shoot")
	yield(GlobalSignals, "player_shot")
	sequence_two()


func sequence_two() -> void:
	gui.set_dice_visibility(true)
	tutorial_label.display_text("Bullet number is generated by your dice set")
