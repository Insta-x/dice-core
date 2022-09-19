extends EnemyWrapper

class_name SniperEnemyWrapper


onready var animation_player := $AnimationPlayer


func dead() -> void:
	.dead()
	animation_player.stop()
