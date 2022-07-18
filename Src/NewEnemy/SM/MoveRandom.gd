extends DiceBehaviour


export (NodePath) onready var agent = get_node(agent) as NewEnemy

var rand_dir := Vector2.RIGHT


func enter() -> void:
	rand_dir = Vector2.RIGHT.rotated(randf() * 2 * PI)


func update(delta: float) -> void:
	agent.goto(agent.global_position + rand_dir)
