extends Area2D

class_name PickupableLimiter


export (int) var upper_limit := 6
export (int) var lower_limit := 0


func _ready() -> void:
	$LowerSprite/Label.text = str(lower_limit)
	$UpperSprite/Label.text = str(upper_limit)
	
	yield(get_tree().create_timer(10), "timeout")
	queue_free()
