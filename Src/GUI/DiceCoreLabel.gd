extends Label

class_name DiceCoreLabel


signal random_finished

onready var timer := $Timer

var false_seed := 1
var true_seed := 1
var random_counter := 4


func random_roll() -> void:
	random_counter = 4
	text = str(randi() % 20 + 1)
	timer.start()


func show_true_seed() -> void:
	text = str(true_seed)


func _on_dice_seed_init(init_seed: int) -> void:
	text = str(init_seed)


func _on_dice_rolled(next_seed: int, limited_seed: int) -> void:
	false_seed = next_seed
	true_seed = limited_seed
	random_roll()


func _on_Timer_timeout() -> void:
	if random_counter <= 0:
		text = str(false_seed)
		emit_signal("random_finished")
		return
	
	random_counter -= 1
	text = str(randi() % 20 + 1)
	timer.start()


