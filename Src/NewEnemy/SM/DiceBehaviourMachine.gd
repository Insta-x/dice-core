extends Node


class_name DiceBehaviourMachine


signal behaviour_changed

onready var current_behaviour : DiceBehaviour = get_child(0)


func new_behaviour(roll: int) -> void:
	for child in get_children():
		child = child as DiceBehaviour
		
		if roll in child.valid_roll:
			current_behaviour.exit()
			current_behaviour = child
			current_behaviour.enter()
			emit_signal("behaviour_changed", current_behaviour.behaviour_name)
			break


func _physics_process(delta: float) -> void:
	current_behaviour.update(delta)
