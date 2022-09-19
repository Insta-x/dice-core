extends Node


const popup_text_scene := preload("res://Src/GUI/GameGUI/TextPopupWrapper.tscn")

onready var game_gui := $CanvasLayer/GameGUI
onready var win_screen := $CanvasLayer/WinScreen
onready var game_world := $GameWorld


func _ready() -> void:
	ScoreTracker.score = 0
	ScoreTracker.connect("score_win", self, "win_game")
	GlobalSignals.connect("text_popup", self, "generate_popup")
	GlobalSignals.connect("dice_set_selected", self, "start_game")
	get_tree().paused = true


func start_game() -> void:
	get_tree().paused = false
	game_gui.show()
	game_world.show()


func win_game() -> void:
	win_screen.show()


func generate_popup(text: String, position: Vector2, color: Color = Color(1, 0, 0)) -> void:
	var pop : Node2D = popup_text_scene.instance()
	pop.get_node("TextPopup").text = text
	pop.global_position = position
	pop.get_node("TextPopup").set("custom_colors/font_color", color)
#	var comp_color := Color.white - color
#	comp_color.a = 1.0
#	pop.get_node("TextPopup").set("custom_colors/font_outline_modulate", Color.white)
	add_child(pop)
