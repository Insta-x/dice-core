extends Node2D

class_name PlayerLimitGun


export (PackedScene) var bullet_scn
export (Vector2) var emit_offset

var can_shoot := true
var modify_upper := false
var upper_limit := 6 setget set_upper_limit
var lower_limit := 0 setget set_lower_limit


func _physics_process(delta: float) -> void:
	modify_upper = Input.is_action_pressed("modify_upper")
	
	if Input.is_action_just_released("scroll_up"):
		if modify_upper:
			self.upper_limit = (upper_limit + 1) % 21
		else:
			self.lower_limit = (lower_limit + 1) % 21
	
	if Input.is_action_just_released("scroll_down"):
		if modify_upper:
			self.upper_limit = (upper_limit + 20) % 21
		else:
			self.lower_limit = (lower_limit + 20) % 21
	
	if Input.is_action_just_pressed("limit_shoot"):
		shoot()


func shoot() -> void:
	if not can_shoot:
		return
	
	if upper_limit - lower_limit < 5:
		GlobalSignals.emit_signal("text_popup", "error: limit to narrow", global_position)
		return
	
	can_shoot = false
	
	var bullet : LimitBullet = bullet_scn.instance()
	bullet.global_rotation = global_rotation
	bullet.global_position = global_position + emit_offset.rotated(global_rotation)
	bullet.upper_limit = upper_limit
	bullet.lower_limit = lower_limit
	owner.get_parent().add_child(bullet)
	
	GlobalSignals.emit_signal("player_limit_shot")
	
	yield(get_tree().create_timer(1), "timeout")
	can_shoot = true


func set_upper_limit(value: int) -> void:
	upper_limit = value
	GlobalSignals.emit_signal("player_upper_limit_gun_changed", upper_limit)


func set_lower_limit(value: int) -> void:
	lower_limit = value
	GlobalSignals.emit_signal("player_lower_limit_gun_changed", lower_limit)
