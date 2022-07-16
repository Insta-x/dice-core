extends Node2D


export (PackedScene) var bullet_scn
export (Vector2) var emit_offset
export (NodePath) onready var dice_core = get_node(dice_core) as DiceCore


func emit() -> void:
	var bullet : Bullet = bullet_scn.instance()
	bullet.roll = dice_core.current_number
	dice_core._next()
	# global_position harus setelah add_child ga tau knp
	bullet.global_rotation = global_rotation
	owner.get_parent().add_child(bullet)
	bullet.global_position = global_position + emit_offset.rotated(global_rotation)
