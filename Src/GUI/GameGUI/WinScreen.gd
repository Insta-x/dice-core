extends NinePatchRect


func win(time_left: float) -> void:
	$VBoxContainer/TimeLeftLabel.text = str(time_left)
