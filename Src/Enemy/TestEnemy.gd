extends KinematicBody2D

class_name Enemy

export (bool) var immune_to_more = false
export (bool) var immune_to_less = false
export (bool) var immune_to_same = false
export (bool) var immune_to_even = true
export (bool) var immune_to_odd = false

export (int) var speed = 50
export (int) var health = 3

signal health_changed
signal behaviour_changed

onready var enemy_gui := $EnemyGUI
onready var dice_wrapper := $DiceWrapper

var current_roll := 0
var data := {}

onready var delay : Timer


func spawn(player : KinematicBody2D)-> void:
	data.player = player
	data.canshoot = false
	data.init = true
	delay = Timer.new()
	add_child(delay)
	delay.wait_time = 0.25
	delay.one_shot = true
	delay.connect("timeout", self, "rolldone")

func _ready() -> void:
	emit_signal("health_changed", health)
	rolldone()
	dice_wrapper.emit_signal("number_changed", current_roll)
	dice_wrapper.emit_signal("dice_core_changed", $DiceWrapper/DiceCore.dice_core_resource)
	dice_wrapper.emit_signal("limiter_changed", $DiceWrapper/Limiter.lower_limit, $DiceWrapper/Limiter.upper_limit)


func reroll() -> void:
	dice_wrapper.get_number(true)
	delay.start()


func rolldone() -> void:
	current_roll = dice_wrapper.get_number(false)
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
	return move_and_slide(d.normalized() * speed * 2)


func self_destruct() -> void:
	queue_free()


func move_to_player() -> void:
	goto(data.player.global_position)


func move_near_player() -> void:
	if data.init:
		if randi() % 2 == 0: data.strafdir = 0.1
		else: data.strafdir = -0.1
	var d = (data.player.global_position - global_position).normalized() * 300
	goto(data.player.global_position - d.rotated(data.strafdir))
	look_at(data.player.global_position)


func shoot() -> void:
	look_at(data.player.global_position)
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
	current_roll = dice_wrapper.get_number()
	print(current_roll)


func check_immune(x : int) -> bool:
	var result := false
	
	if immune_to_more and x > current_roll:
		GlobalSignals.emit_signal("text_popup", "immune to higher", global_position)
		result = true
	
	if immune_to_less and x < current_roll:
		GlobalSignals.emit_signal("text_popup", "immune to lower", global_position)
		result = true
	
	if immune_to_same and x == current_roll:
		GlobalSignals.emit_signal("text_popup", "immune to equal", global_position)
		result = true
	
	if immune_to_even and x % 2 == 0:
		GlobalSignals.emit_signal("text_popup", "immune to even", global_position)
		result = true
	
	if immune_to_odd and x % 2 == 1:
		GlobalSignals.emit_signal("text_popup", "immune to odd", global_position)
		result = true
	
	return result


func _on_Area2D_body_entered(body: Bullet) -> void:
	if body is LimitBullet:
		dice_wrapper.set_new_limit(body.lower_limit, body.upper_limit)
	
	body.queue_free()
	
	if check_immune(body.roll):
		return
	
#	print("health " + str(health))

	health -= 1
	emit_signal("health_changed", health)
	
	if health <= 0:
		queue_free()

