extends DiceBehaviour


export (NodePath) onready var agent = get_node(agent) as NewEnemy
export (NodePath) onready var anim = get_node(anim)


func enter() -> void:
	agent.look_at(agent.player.global_position)
	anim.play("Shoot")
