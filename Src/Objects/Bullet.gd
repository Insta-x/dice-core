extends KinematicBody2D

class_name Bullet


var damage := 1
export (float) var movespeed := 1.0
var bullet_particle := preload("res://Src/NewEnemy/Effects/BulletParticle.tscn")


func _physics_process(delta: float) -> void:
	if move_and_collide(Vector2.RIGHT.rotated(global_rotation) * movespeed * delta):
		var particle_effect := bullet_particle.instance()
		get_parent().call_deferred("add_child", particle_effect)
		particle_effect.set_deferred("global_position", global_position)
		particle_effect.set_deferred("global_rotation", global_rotation)
		
		queue_free()


func _on_Timer_timeout():
	queue_free()
