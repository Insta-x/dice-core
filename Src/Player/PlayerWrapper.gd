extends Node2D


export (bool) var invincible := false

signal shoot_input
signal hack_input(shoot, add_seed)
signal dash_input

onready var dice_wrapper := $DiceWrapper

var can_dash := true


func _ready() -> void:
	GlobalSignals.connect("time_over", self, "game_over")
	GlobalSignals.connect("indexer_selected", dice_wrapper, "set_new_indexer")
	GlobalSignals.connect("dice_core_selected", dice_wrapper, "set_new_dice_core")
	GlobalSignals.connect("limiter_selected", dice_wrapper, "set_new_limit")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		emit_signal("shoot_input")
		get_tree().set_input_as_handled()
	
	if event.is_action_released("scroll_up"):
		emit_signal("hack_input", false, 1)
		get_tree().set_input_as_handled()
	
	if event.is_action_released("scroll_down"):
		emit_signal("hack_input", false, 9)
		get_tree().set_input_as_handled()
	
	if event.is_action_pressed("limit_shoot"):
		emit_signal("hack_input", true, 0)
		get_tree().set_input_as_handled()
	
	if event.is_action_pressed("dash") and can_dash:
		can_dash = false
		emit_signal("dash_input")
		get_tree().set_input_as_handled()
		
		yield(get_tree().create_timer(1), "timeout")
		can_dash = true


func _on_DiceWrapper_number_generated(number: int) -> void:
	$DiceRollSFX.play()
	GlobalSignals.emit_signal("player_number_generated", number)


func _on_DiceWrapper_indexer_changed(new_indexer: int) -> void:
	GlobalSignals.emit_signal("player_indexer_changed", new_indexer)


func _on_DiceWrapper_dice_core_changed(resource: DiceCoreResource) -> void:
	GlobalSignals.emit_signal("player_dice_changed", resource)


func _on_DiceWrapper_limiter_changed(new_limit: int) -> void:
	GlobalSignals.emit_signal("player_limiter_changed", new_limit)


func _on_DiceCore_dice_rolled(next_seed: int, limited_seed: int) -> void:
	GlobalSignals.emit_signal("player_dice_rolled", next_seed, limited_seed)


func _on_HazardDetector_area_entered(area: Area2D) -> void:
	if invincible:
		return
	
	OS.delay_msec(500)
	game_over()
	hide()
	$PlayerDIedSFX.play()
	GlobalSignals.emit_signal("player_died")


func game_over() -> void:
	$Player.set_physics_process(false)
	$Player/PlayerHazardDetector/CollisionShape2D.set_deferred("disabled", true)
