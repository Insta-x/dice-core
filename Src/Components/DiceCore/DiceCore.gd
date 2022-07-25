extends Node

class_name DiceCore


export (bool) var is_player := false
export (int) var init_number := 1
export (Resource) var dice_core_resource = dice_core_resource as DiceCoreResource

signal dice_rolled(number)

onready var current_number := init_number setget set_current_number


func next(modulo: int) -> void:
	self.current_number = dice_core_resource._formula(current_number) % modulo
	emit_signal("dice_rolled", current_number)


func set_current_number(value: int) -> void:
	current_number = value
	var err_code : int = dice_core_resource._check_seed(current_number)
	
	if is_player:
		match err_code:
			1:
				GlobalSignals.emit_signal("player_error_seed_zero")
				print("Error seed zero")
			_:
				pass


func _on_DiceWrapper_limiter_changed(lower_limit: int, upper_limit: int) -> void:
	var err_code : int = dice_core_resource._check_limiter(lower_limit, upper_limit)
	
	if is_player:
		match err_code:
			1:
				GlobalSignals.emit_signal("player_warning_limiter")
				print("Warning limiter incompatible")
			_:
				pass
