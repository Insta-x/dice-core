extends Node2D


export (PackedScene) var bullet_scn
export (Vector2) var emit_offset
export (NodePath) onready var dice_wrapper = get_node(dice_wrapper) as DiceWrapper


func shoot() -> void:
	get_parent().get_parent().get_node("AnimationPlayer").play("Shoot")
	var bullet : RollBullet = bullet_scn.instance()
#	bullet.roll = dice_wrapper.get_number(false)
	bullet.global_rotation = global_rotation
	bullet.global_position = global_position + emit_offset.rotated(global_rotation)
	bullet.z_index = -1
	owner.get_parent().add_child(bullet)

