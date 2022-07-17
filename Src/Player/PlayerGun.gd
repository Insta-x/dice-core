extends Node2D


export (PackedScene) var bullet_scn
export (Vector2) var emit_offset
export (NodePath) onready var dice_wrapper = get_node(dice_wrapper) as DiceWrapper

var can_shoot := true


func shoot() -> void:
	if not can_shoot:
		return
	
	var bullet : Bullet = bullet_scn.instance()
	bullet.roll = dice_wrapper.get_number()
	# global_position harus setelah add_child ga tau knp
	bullet.global_rotation = global_rotation
	owner.get_parent().add_child(bullet)
	bullet.global_position = global_position + emit_offset.rotated(global_rotation)
	
	can_shoot = false
	GlobalSignals.emit_signal("player_shot")


func _on_PlayerAnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "Shoot":
		can_shoot = true
