extends Node2D


const enemy_scenes := [
	preload("res://Src/Enemy/Ranged/RangedEnemy1.tscn")
]

export (NodePath) onready var player = get_node(player) as Player

func spawn() -> void:
	var select : int = randi() % len(enemy_scenes)
	var enemy : Enemy = enemy_scenes[select].instance()
	enemy.spawn(player)
	get_parent().call_deferred("add_child", enemy)

func _ready() -> void:
	spawn()
