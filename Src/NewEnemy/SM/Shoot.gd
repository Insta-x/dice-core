extends DiceBehaviour


export (NodePath) onready var agent = get_node(agent) as NewEnemy
export (NodePath) onready var gun = get_node(gun)


func enter() -> void:
	agent.look_at(agent.player.global_position)
	gun.shoot()
