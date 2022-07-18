extends Node2D

class_name EnemyWrapper


const pickup_dice_core_scn := preload("res://Src/Objects/PickupableDiceCore.tscn")
const pickup_limiter_scn := preload("res://Src/Objects/PickupableLimiter.tscn")

export (NodePath) onready var body = get_node(body) as Enemy
export (int) var score := 1

onready var enemy_gui := $GUIwrapper
onready var dice_behaviour_machine := $DiceBehaviourMachine
onready var dice_wrapper := $DiceWrapper
onready var dice_timer := $DiceTimer


func init(dice_core: DiceCoreResource, lower_limit: int, upper_limit: int) -> void:
	dice_wrapper.set_new_dice_core(dice_core)
	dice_wrapper.set_new_limit(lower_limit, upper_limit)


func dead() -> void:
	set_process(false)
	set_physics_process(false)
	GlobalSignals.emit_signal("text_popup", str(score), global_position, Color(1, 0.84, 0))
	GlobalSignals.emit_signal("enemy_died")
	ScoreTracker.score += score
	yield(get_tree().create_timer(1), "timeout")
	
	var drop_dice : PickupableDiceCore = pickup_dice_core_scn.instance()
	drop_dice.dice_core_resource = $DiceWrapper/DiceCore.dice_core_resource
	drop_dice.global_position = body.global_position - Vector2(40, 0)
	get_parent().call_deferred("add_child", drop_dice)
	
	var drop_limiter : PickupableLimiter = pickup_limiter_scn.instance()
	drop_limiter.lower_limit = $DiceWrapper/Limiter.lower_limit
	drop_limiter.upper_limit = $DiceWrapper/Limiter.upper_limit
	drop_limiter.global_position = body.global_position + Vector2(40, 0)
	get_parent().call_deferred("add_child", drop_limiter)
	
	queue_free()


func _on_RollLabel_roll_anim_finished() -> void:
	dice_behaviour_machine.new_behaviour(dice_wrapper.get_number(false))
