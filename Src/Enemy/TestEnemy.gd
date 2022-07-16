extends KinematicBody2D

export (int) var speed = 50
export (PackedScene) var bullet_scn
onready var dice_core := $DiceCore

var current_roll := 0
var data := {}

func spawn(player : KinematicBody2D)-> void:
	data.player = player
	data.canshoot = false
	data.init = true


func _ready() -> void:
	current_roll = dice_core.get_number(false)

func reroll() -> void:
	current_roll = dice_core.get_number()
	data.init = true

func _physics_process(delta: float) -> void:
	match current_roll:
		0:
			self_destruct()
		1, 2, 3, 4, 5, 6:
			do_nothing()
	data.init = false


func goto(pos : Vector2, mundur := false) -> Vector2:
	look_at(pos)
	var d = pos - self.global_position
	if mundur: d = -d
	return move_and_slide(d.normalized() * speed)


func self_destruct() -> void:
	queue_free()

func move_to_player() -> void:
	goto(data.player.global_position)

func shoot() -> void:
	look_at(data.player)
	if data.init:
		$Emitter.emit()

func block_attack() -> void:
	pass

func move_random() -> void:
	if data.init:
		data.randdir = Vector2.RIGHT.rotated(randf() * 2 * PI)
	goto(global_position + data.randdir)

func do_nothing() -> void:
	pass

func avoid_player():
	goto(data.player.global_position, true)
	

func _on_Timer_timeout() -> void:
	current_roll = dice_core.get_number()
	print(current_roll)


