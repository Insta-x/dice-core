extends Label


signal roll_anim_finished

var roll_number := 0
var true_number := 0


func change_number(number: int) -> void:
	true_number = number
	text = str(true_number)


func roll(number: int) -> void:
	roll_number = randi() % 20 + 1
	$AnimationPlayer.play("Roll")
	true_number = number


func random_text() -> void:
	roll_number = (roll_number * 31 + 7) % 20 + 1
	text = str(roll_number)


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	text = str(true_number)
	emit_signal("roll_anim_finished")
