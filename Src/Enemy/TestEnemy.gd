extends KinematicBody2D


onready var dice_core := $DiceCore

var current_roll := 0


func _ready() -> void:
	current_roll = dice_core.get_number(false)


func _physics_process(delta: float) -> void:
	match current_roll:
		0:
			self_destruct()
		1, 2, 3, 4, 5, 6:
			do_nothing()


func self_destruct() -> void:
	queue_free()


func do_nothing() -> void:
	pass
