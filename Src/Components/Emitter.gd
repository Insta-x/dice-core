extends Node2D

class_name Emitter


export (PackedScene) var emitted_scn
export (Vector2) var emit_offset

signal shot(emitted_ref)


func emit() -> void:
	var emitted : Node2D = emitted_scn.instance()
	#global position harus setelah addchild ga tau knp
	emitted.global_rotation = global_rotation
	owner.get_parent().add_child(emitted)
	emitted.global_position = global_position + emit_offset.rotated(global_rotation)
	emit_signal("shot", weakref(emitted))
