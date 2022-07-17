extends Node2D


const enemy_scenes := [
	preload("res://Src/Enemy/Ranged/RangedEnemy1.tscn"),
	preload("res://Src/Enemy/Slime/SlimeEnemy1.tscn"),
	preload("res://Src/Enemy/Tank/TankEnemy1.tscn"),
	preload("res://Src/Enemy/Tank/TankEnemy2.tscn"),
	preload("res://Src/Enemy/Tank/TankEnemy3.tscn"),
	preload("res://Src/Enemy/Tank/TankEnemy4.tscn"),
	preload("res://Src/Enemy/Tank/TankEnemy5.tscn")
]

export (NodePath) onready var player = get_node(player) as Player


func spawn() -> void:
	var select : int = randi() % enemy_scenes.size()
	var pos : int = randi() % get_children().size()
	if get_child(pos).global_position.distance_to(player.global_position) < 50:
		pos += 1
	
	var enemy : Enemy = enemy_scenes[select].instance()
	enemy.spawn(player)
	enemy.global_position = get_child(pos).global_position
	get_parent().call_deferred("add_child", enemy)


func _ready() -> void:
	pass
	for i in range(6):
		yield(get_tree().create_timer(0.5), "timeout")
		spawn()
