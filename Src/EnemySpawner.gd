extends Node2D


const enemy_scenes := [
	preload("res://Src/Enemy/TestEnemy.tscn")
]

export (NodePath) onready var player = get_node(player) as Player


func spawn() -> void:
	pass
