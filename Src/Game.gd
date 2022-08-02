extends Node


const popup_text_scene := preload("res://Src/GUI/TextPopupWrapper.tscn")


func _ready() -> void:
	ScoreTracker.score = 0
	GlobalSignals.connect("text_popup", self, "generate_popup")


func generate_popup(text: String, position: Vector2, color: Color = Color(1, 0, 0)) -> void:
	var pop : Node2D = popup_text_scene.instance()
	pop.get_node("TextPopup").text = text
	pop.global_position = position
	pop.get_node("TextPopup").set("custom_colors/font_color", color)
	add_child(pop)
