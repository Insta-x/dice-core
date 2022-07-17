extends Node


const popup_text_scene := preload("res://Src/GUI/TextPopup.tscn")


func _ready() -> void:
	GlobalSignals.connect("text_popup", self, "generate_popup")


func generate_popup(text: String, position: Vector2) -> void:
	var pop : Label = popup_text_scene.instance()
	pop.text = text
	pop.rect_global_position = position
	add_child(pop)
