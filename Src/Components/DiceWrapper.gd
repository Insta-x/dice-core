extends Node

class_name DiceWrapper


signal number_generated(number)
signal dice_core_changed(resource)
signal limiter_changed(new_limit)
signal indexer_changed(new_indexer)

onready var dice_core : DiceCore = $DiceCore
onready var limiter : Limiter = $Limiter
onready var indexer : Indexer = $Indexer


func get_number(next: bool = true) -> int:
	var result : int = indexer.index(limiter.limit(dice_core.current_seed))
	if next:
		dice_core.roll(limiter.limit)
		emit_signal("number_generated", get_number(false))
	return result


func hacked(hack_seed: int) -> void:
	var pre_limit := limiter.limit
	var pre_index := indexer.start
	dice_core.current_seed = hack_seed
	limiter.limit = 10
	indexer.start = 0
	dice_core.roll(limiter.limit)
#	print(hack_seed, ' ', dice_core.current_seed)
	emit_signal("number_generated", get_number(false))
	limiter.limit = pre_limit
	indexer.start = pre_index


func set_new_dice_core(dice_core_resource: DiceCoreResource) -> void:
	dice_core.dice_core_resource = dice_core_resource
	emit_signal("dice_core_changed", dice_core_resource)


func set_new_limit(new_limit: int) -> void:
	limiter.limit = new_limit
	emit_signal("limiter_changed", new_limit)


func set_new_indexer(new_start: int) -> void:
	indexer.start = new_start
	emit_signal("indexer_changed", new_start)
