extends KinematicBody2D

class_name Bullet


var roll := 1
var damage := 1
export (float) var movespeed := 1.0


func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.RIGHT.rotated(global_rotation) * movespeed * delta)
