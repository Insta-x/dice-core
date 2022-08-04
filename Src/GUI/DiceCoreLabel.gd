extends Label


signal random_finished


var true_seed := 1


func random_roll(true_number: int) -> void:
	for i in range(4):
		text = str(randi() % 20 + 1)
		yield(get_tree().create_timer(0.05), "timeout")
	text = str(true_number)
	emit_signal("random_finished")


func show_true_seed() -> void:
	text = str(true_seed)
