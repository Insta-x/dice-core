extends DiceBehaviour


export (NodePath) onready var agent = get_node(agent) as NewEnemy

var strafe_dir := 0.1


func enter() -> void:
	if randi() % 2 == 0:
		strafe_dir = 0.1
	else:
		strafe_dir = -0.1


func update(delta: float) -> void:
	var d = (agent.player.global_position - agent.global_position).normalized() * 300
	agent.goto(agent.player.global_position - d.rotated(strafe_dir))
	agent.look_at(agent.player.global_position)
