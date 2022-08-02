extends Area2D

class_name Pickupable


export (NodePath) onready var prompt_label = get_node(prompt_label) as Label


func show_prompt() -> void:
	prompt_label.show()


func hide_prompt() -> void:
	prompt_label.hide()
