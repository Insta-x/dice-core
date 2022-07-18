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

const dice_core_res := [
	preload("res://Src/Components/DiceCore/AddMulter/Add1Mult7DiceCore.tres"),
	preload("res://Src/Components/DiceCore/AddMulter/Add2Mult3DiceCore.tres"),
	preload("res://Src/Components/DiceCore/AddMulter/Add3Mult5DiceCore.tres"),
	preload("res://Src/Components/DiceCore/Adder/Add3DiceCore.tres"),
	preload("res://Src/Components/DiceCore/Adder/Add5DiceCore.tres"),
	preload("res://Src/Components/DiceCore/Adder/Add7DiceCore.tres"),
	preload("res://Src/Components/DiceCore/MultAdder/Mult3Add2DiceCore.tres"),
	preload("res://Src/Components/DiceCore/MultAdder/Mult5Add3DiceCore.tres"),
	preload("res://Src/Components/DiceCore/MultAdder/Mult7Add1DiceCore.tres"),
	preload("res://Src/Components/DiceCore/Multiplier/Multiply3DiceCore.tres"),
	preload("res://Src/Components/DiceCore/Multiplier/Multiply5DiceCore.tres"),
	preload("res://Src/Components/DiceCore/Multiplier/Multiply7DiceCore.tres")
]

const spawn_anim_sprite := preload("res://Src/Enemy/SpawnAnimation.tscn")

export (NodePath) onready var player = get_node(player) as Player

func spawn() -> void:
	var select : int = randi() % 3
	var dice_sel := randi() % dice_core_res.size()
	var lower_limit := randi() % 14
	var upper_limit := lower_limit + randi() % (21 - lower_limit)
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
	enemy.global_position = get_child(pos).global_position
	spawn_anim.global_position = get_child(pos).global_position
	get_parent().call_deferred("add_child", enemy)
	get_parent().call_deferred("add_child", spawn_anim)
	enemy.call_deferred("spawn", player, dice_core_res[dice_sel], lower_limit, upper_limit)
	GlobalGame.enemy_count += 1


func _ready() -> void:
	GlobalSignals.connect("batu_died",self,"game_start")
	GlobalSignals.connect("enemy_died",self,"decrease_enemy_count")


func game_start():
	for i in range(3):
		yield(get_tree().create_timer(0.5), "timeout")
		spawn()
	
	while (true):
		yield(get_tree().create_timer(3), "timeout")
		if (GlobalGame.enemy_count <= 6):
			spawn()

func decrease_enemy_count():
	GlobalGame.enemy_count -= 1

