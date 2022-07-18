extends DiceBehaviour


export (NodePath) onready var agent = get_node(agent) as NewEnemy


func update(delta: float) -> void:
	agent.goto(agent.player.global_position)
