extends DiceCore


var check_lower_limit := 0
var check_upper_limit := 6


func set_current_number(value: int) -> void:
	.set_current_number(value)
	
	var err_code : int = dice_core_resource._check_seed(current_number)
	match err_code:
		1:
			GlobalSignals.emit_signal("player_error_seed_zero", true)
		_:
			GlobalSignals.emit_signal("player_error_seed_zero", false)


func _on_DiceWrapper_dice_core_changed(_resource: DiceCoreResource) -> void:
	self.current_number = current_number
	
	var err_code : int = dice_core_resource._check_limiter(check_lower_limit, check_upper_limit)
	match err_code:
		1:
			GlobalSignals.emit_signal("player_warning_limiter", true)
		_:
			GlobalSignals.emit_signal("player_warning_limiter", false)


func _on_DiceWrapper_limiter_changed(lower_limit: int, upper_limit: int) -> void:
	check_lower_limit = lower_limit
	check_upper_limit = upper_limit
	
	var err_code : int = dice_core_resource._check_limiter(lower_limit, upper_limit)
	match err_code:
		1:
			GlobalSignals.emit_signal("player_warning_limiter", true)
		_:
			GlobalSignals.emit_signal("player_warning_limiter", false)
