extends Label


export (float) var time_per_char := 0.03

signal display_finished


func display_text(true_text: String = "lorem ipsum") -> void:
	text = ""
	
	add_text(true_text)
	
	emit_signal("display_finished")


func add_text(added_text: String = "") -> void:
	var true_text = text + added_text
	
	while text.hash() != true_text.hash():
		text += true_text[text.length()]
		yield(get_tree().create_timer(time_per_char), "timeout")
	
	emit_signal("display_finished")
