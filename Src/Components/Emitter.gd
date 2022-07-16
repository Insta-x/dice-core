extends Node2D

class_name Emitter


export (PackedScene) var bullet_scn
export (Vector2) var emit_offset

signal shot(bullet_ref)


func emit() -> void:
	var bullet : Node2D = bullet_scn.instance()
	#global position harus setelah addchild ga tau knp
	bullet.global_rotation = global_rotation
	owner.get_parent().add_child(bullet)
	bullet.global_position = global_position + emit_offset.rotated(global_rotation)
	emit_signal("shot", weakref(bullet))
