extends Node2D


const enemy_scenes := [
	preload("res://Src/NewEnemy/LanceEnemyWrapper.tscn"),
	preload("res://Src/NewEnemy/SniperEnemyWrapper.tscn"),
	preload("res://Src/NewEnemy/TankEnemyWrapper.tscn")
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
	var limit := randi() % 13 + 8
	var index := randi() % 20 + 1
	
	var pos : int = randi() % get_children().size()
	if player.global_position.distance_squared_to(get_child(pos).global_position) < 100000:
		pos = (pos + 1) % get_children().size()
	
	var enemy : EnemyWrapper
	enemy = enemy_scenes[select].instance()
	
	var spawn_anim : AnimatedSprite = spawn_anim_sprite.instance()
	enemy.global_position = get_child(pos).global_position
	spawn_anim.global_position = get_child(pos).global_position
	get_parent().call_deferred("add_child", enemy)
	get_parent().call_deferred("add_child", spawn_anim)
	enemy.call_deferred("init", player, dice_core_res[dice_sel], limit, index)
	GlobalGame.enemy_count += 1


func _ready() -> void:
	GlobalGame.enemy_count = 1 # For TutorialEnemy
	GlobalSignals.connect("batu_died",self,"game_start")
	GlobalSignals.connect("enemy_died",self,"decrease_enemy_count")


func game_start():
	for i in range(3):
		yield(get_tree().create_timer(0.5), "timeout")
		spawn()
	
	while (true):
		yield(get_tree().create_timer(3), "timeout")
		if (GlobalGame.enemy_count < 3):
			spawn()


func decrease_enemy_count():
	GlobalGame.enemy_count -= 1

