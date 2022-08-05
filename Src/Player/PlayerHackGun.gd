extends Node2D


const bullet_scn := preload("res://Src/Objects/HackBullet.tscn")
export (Vector2) var emit_offset

var can_shoot := true
var hack_seed := 0 setget set_hack_seed


func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("scroll_up"):
		self.hack_seed = (hack_seed + 1) % 20
	
	if Input.is_action_just_released("scroll_down"):
		self.hack_seed = (hack_seed + 19) % 20
	
	if Input.is_action_just_pressed("limit_shoot"):
		shoot()


func shoot() -> void:
	if not can_shoot:
		return
	
	can_shoot = false
	
	var bullet : HackBullet = bullet_scn.instance()
	bullet.global_rotation = global_rotation
	bullet.global_position = global_position + emit_offset.rotated(global_rotation)
	bullet.hack_seed = hack_seed
	owner.get_parent().add_child(bullet)
	
	GlobalSignals.emit_signal("player_hack_shot")
	
	yield(get_tree().create_timer(1), "timeout")
	can_shoot = true


func set_hack_seed(value: int) -> void:
	hack_seed = value
	GlobalSignals.emit_signal("player_hack_seed_changed", hack_seed)
