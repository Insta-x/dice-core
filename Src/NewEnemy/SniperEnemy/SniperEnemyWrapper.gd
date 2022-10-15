extends EnemyWrapper

class_name SniperEnemyWrapper


onready var animation_player := $AnimationPlayer


func dead() -> void:
	animation_player.stop()
	.dead()
