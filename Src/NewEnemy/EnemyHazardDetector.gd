extends Area2D


signal limit_bullet_detected(lower_limit, upper_limit)
signal player_bullet_detected(roll)


func _on_EnemyHazardDetector_body_entered(body: Bullet) -> void:
	if body is LimitBullet:
		emit_signal("limit_bullet_detected", body.lower_limit, body.upper_limit)
	else:
		emit_signal("player_bullet_detected", body.roll)
	
	body.queue_free()
