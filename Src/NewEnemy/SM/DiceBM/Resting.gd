extends DiceBehaviour

export (NodePath) onready var anim = get_node(anim) as AnimatedSprite

func enter() -> void:
	anim.speed_scale = 0
	

