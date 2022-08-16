extends Label


export (float) var time_per_char := 0.03


func _ready() -> void:
	display_text()


func display_text(true_text: String = "lorem ipsum") -> void:
	text = ""
	
	while text.hash() != true_text.hash():
		text += true_text[text.length()]
		yield(get_tree().create_timer(time_per_char), "timeout")
