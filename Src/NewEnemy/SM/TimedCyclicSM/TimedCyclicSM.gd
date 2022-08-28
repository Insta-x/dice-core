extends Node

class_name TimedCyclicSM


onready var current_state : TimedCyclicState = get_child(1) setget set_current_state
onready var timer := $Timer

var current_state_id := 0 setget set_current_state_id


func _ready() -> void:
	timer.start(current_state.time)


func _physics_process(delta: float) -> void:
	current_state.update(delta)


func next_state() -> void:
	self.current_state_id = (current_state_id + 1) % (get_child_count() - 1)
	timer.start(current_state.time)


func set_current_state_id(new_state_id: int) -> void:
	current_state_id = new_state_id
	self.current_state = get_child(current_state_id + 1)


func set_current_state(new_state: TimedCyclicState) -> void:
	current_state.exit()
	current_state = new_state
	current_state.enter()


func _on_Timer_timeout() -> void:
	next_state()
