extends EnemyHealth


export (NodePath) onready var regen_timer = get_node(regen_timer) as Timer


func hurt(roll: int) -> void:
	.hurt(roll)
	regen_timer.start(1.0)


func _on_RegenTimer_timeout() -> void:
	self.health += 1
	regen_timer.start(0.5)
