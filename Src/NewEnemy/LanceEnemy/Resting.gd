extends TimedCyclicState


export (NodePath) onready var animated_sprite = get_node(animated_sprite) as AnimatedSprite


func enter() -> void:
	animated_sprite.speed_scale = 0
