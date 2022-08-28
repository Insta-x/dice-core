extends DiceBehaviour


export (NodePath) onready var health = get_node(health) as EnemyHealth


func enter() -> void:
	health.health = 0
