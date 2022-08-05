extends KinematicBody2D

class_name Bullet


var damage := 1
export (float) var movespeed := 1.0


func _physics_process(delta: float) -> void:
	if move_and_collide(Vector2.RIGHT.rotated(global_rotation) * movespeed * delta):
		queue_free()


func _on_Timer_timeout():
	queue_free()
