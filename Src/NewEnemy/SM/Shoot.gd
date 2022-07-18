extends Node


export (NodePath) onready var agent = get_node(agent) as NewEnemy
export (NodePath) onready var emitter = get_node(emitter) as Emitter


func enter() -> void:
	agent.look_at(agent.player.global_position)
	emitter.emit()
