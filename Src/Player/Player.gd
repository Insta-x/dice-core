extends KinematicBody2D

class_name Player


var movespeed := 200.0
var dashspeed := 1000.0
#var velocity := Vector2.ZERO
var dashing := false
var dash_dir := Vector2.ZERO


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if dashing:
		move_and_slide(dash_dir * dashspeed)
	else:
		move_and_slide(get_direction() * movespeed)


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized()


func _on_PlayerWrapper_dash_input() -> void:
	dash_dir = get_direction()
	if dash_dir == Vector2.ZERO:
		return
	
	GlobalSignals.emit_signal("player_dashed")
	dashing = true
	yield(get_tree().create_timer(0.2), "timeout")
	dashing = false
