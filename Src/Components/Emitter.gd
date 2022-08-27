extends Node2D

class_name Emitter


export (PackedScene) var emitted_scn
export (Vector2) var emit_offset
var stop = false
signal shot(emitted_ref)


func emit() -> void:
	stop = false
	$AfterImageTimer.start()
	#global position harus setelah addchild ga tau knp
	while(!stop):
		yield(get_tree().create_timer(0.04),"timeout")
		var emitted : Node2D = emitted_scn.instance()
		emitted.global_rotation = global_rotation
		owner.get_parent().add_child(emitted)
		emitted.global_position = global_position + emit_offset.rotated(global_rotation)
		emit_signal("shot", weakref(emitted))


func _on_AfterImageTimer_timeout():
	stop = true
