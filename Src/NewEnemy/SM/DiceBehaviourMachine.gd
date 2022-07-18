extends Node

class_name DiceBehaviourMachine


signal behaviour_changed

onready var current_behaviour : DiceBehaviour = get_child(0) setget set_current_behaviour


func _ready() -> void:
	emit_signal("behaviour_changed", current_behaviour.behaviour_name)


func new_behaviour(roll: int) -> void:
	for child in get_children():
		child = child as DiceBehaviour
		
		if roll in child.valid_roll:
			self.current_behaviour = child
			break
	
	self.current_behaviour = get_child(0)


func set_current_behaviour(new_behaviour: DiceBehaviour) -> void:
	current_behaviour.exit()
	current_behaviour = new_behaviour
	current_behaviour.enter()
	emit_signal("behaviour_changed", current_behaviour.behaviour_name)


func _physics_process(delta: float) -> void:
	current_behaviour.update(delta)
