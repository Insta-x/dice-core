extends Node2D


const enemy_scenes := [
	preload("res://Src/Enemy/Ranged/RangedEnemy1.tscn"),
	preload("res://Src/Enemy/Slime/SlimeEnemy1.tscn")
]
const tank_scenes := [
	preload("res://Src/Enemy/Tank/TankEnemy1.tscn"),
	preload("res://Src/Enemy/Tank/TankEnemy2.tscn"),
	preload("res://Src/Enemy/Tank/TankEnemy3.tscn"),
	preload("res://Src/Enemy/Tank/TankEnemy4.tscn"),
	preload("res://Src/Enemy/Tank/TankEnemy5.tscn")
]

const spawn_anim_sprite := preload("res://Src/Enemy/SpawnAnimation.tscn")

export (NodePath) onready var player = get_node(player) as Player

func spawn() -> void:
	var select : int = randi() % 3
	var pos : int = randi() % get_children().size()
	print(player.global_position.distance_squared_to(get_child(pos).global_position))
	if player.global_position.distance_squared_to(get_child(pos).global_position) < 100000:
		pos += 1
	
	var enemy : Enemy
	if select == 2:
		var sel := randi() % 5
		enemy = tank_scenes[sel].instance()
	else:
		enemy = enemy_scenes[select].instance()
	
	var spawn_anim : AnimatedSprite = spawn_anim_sprite.instance()
	enemy.spawn(player)
	enemy.global_position = get_child(pos).global_position
	spawn_anim.global_position = get_child(pos).global_position
	get_parent().call_deferred("add_child", enemy)
	get_parent().call_deferred("add_child", spawn_anim)


func _ready() -> void:
	pass
#	for i in range(10):
#		yield(get_tree().create_timer(0.5), "timeout")
#		spawn()
