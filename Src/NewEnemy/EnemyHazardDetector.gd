extends Area2D


signal hack_bullet_detected(hack_seed)
signal player_bullet_detected(roll)


func _on_EnemyHazardDetector_body_entered(body: Bullet) -> void:
	if body is HackBullet:
		emit_signal("hack_bullet_detected", body.hack_seed)
	else:
		emit_signal("player_bullet_detected", body.roll)
	
	body.queue_free()
