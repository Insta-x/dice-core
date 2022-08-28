extends Area2D


signal hack_bullet_detected(hack_seed)
signal player_bullet_detected(roll)

var bullet_particle := preload("res://Src/NewEnemy/Effects/BulletParticle.tscn")

func _on_EnemyHazardDetector_body_entered(body: Bullet) -> void:
	if body is HackBullet:
		emit_signal("hack_bullet_detected", body.hack_seed)
	else:
		emit_signal("player_bullet_detected", body.roll)
		var particle_effect := bullet_particle.instance()
		get_parent().call_deferred("add_child", particle_effect)
		particle_effect.set_deferred("global_position", body.global_position)
		particle_effect.set_deferred("global_rotation", body.global_rotation)
		
	
	body.queue_free()
