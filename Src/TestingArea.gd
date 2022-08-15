extends Node


onready var gui := $CanvasLayer/GUI


func _ready() -> void:
	gui.set_dice_visibility(false)
	gui.set_hack_visibility(false)
