extends Node2D

class_name EnemyWrapper


const pickup_dice_core_scn := preload("res://Src/Objects/PickupableDiceCore.tscn")
const pickup_limiter_scn := preload("res://Src/Objects/PickupableLimiter.tscn")
const death_particle_scn := preload("res://Src/NewEnemy/Effects/DeathParticle.tscn")

export (NodePath) onready var body = get_node(body) as NewEnemy
export (int) var score := 1
export (int) var maxiter := 1

onready var enemy_gui := $GUIwrapper
onready var dice_behaviour_machine := $DiceBehaviourMachine
onready var dice_wrapper := $DiceWrapper
onready var dice_timer := $DiceTimer

func _ready():
	$EnemyHealth.connect("enemy_hurt",body.spriteWrapper,"blink")

func init(player: Player, dice_core: DiceCoreResource, new_limit: int, new_start: int) -> void:
	body.player = player
	dice_wrapper.set_new_dice_core(dice_core)
	dice_wrapper.set_new_limit(new_limit)
	dice_wrapper.set_new_indexer(new_start)

func customprocess() -> void:
	if iter == 0:
		dice_behaviour_machine.new_behaviour(iter + 1)

var iter := 0
func _process(delta:float) -> void:
	iter = (iter + 1) % maxiter
	customprocess()
	

func hacked(hack_seed: int) -> void:
	dice_wrapper.hacked(hack_seed)
	enemy_gui.hacked()
	dice_timer.start()


func dead() -> void:
	set_process(false)
	set_physics_process(false)
	dice_behaviour_machine.set_physics_process(false)
	dice_timer.paused = true
	GlobalSignals.emit_signal("text_popup", str(score), global_position, Color(1, 0.84, 0))
	GlobalSignals.emit_signal("enemy_died")
	ScoreTracker.score += score
	yield(get_tree().create_timer(1), "timeout")
	
	var drop_dice : PickupableDiceCore = pickup_dice_core_scn.instance()
	drop_dice.dice_core_resource = $DiceWrapper/DiceCore.dice_core_resource
	drop_dice.global_position = body.global_position - Vector2(40, 0)
	get_parent().call_deferred("add_child", drop_dice)
	
#	var drop_limiter : PickupableLimiter = pickup_limiter_scn.instance()
#	drop_limiter.lower_limit = $DiceWrapper/Limiter.lower_limit
#	drop_limiter.upper_limit = $DiceWrapper/Limiter.upper_limit
#	drop_limiter.global_position = body.global_position + Vector2(40, 0)
#	get_parent().call_deferred("add_child", drop_limiter)
	
	var particle_effect := death_particle_scn.instance()
	particle_effect.global_position = body.global_position
	get_parent().call_deferred("add_child", particle_effect)
	print(particle_effect.global_position)
	queue_free()

