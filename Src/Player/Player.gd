extends KinematicBody2D


signal player_shot

var movespeed := 200
var velocity := Vector2.ZERO


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		emit_signal("player_shot")
	
	get_tree().set_input_as_handled()


func _physics_process(delta: float) -> void:
	velocity += move_and_slide(get_direction() * movespeed)
	look_at(get_global_mouse_position())


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized()
