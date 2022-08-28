extends TimedCyclicState


export (NodePath) onready var agent = get_node(agent) as NewEnemy
export (NodePath) onready var animation_player = get_node(animation_player) as AnimationPlayer


func enter() -> void:
	agent.look_at(agent.player.global_position)
	animation_player.play("Shoot")
