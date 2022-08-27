extends Pickupable

class_name PickupableLimiter


export (int) var limit := 2


func _ready() -> void:
	$Sprite/Label.text = str(limit)
	
	yield(get_tree().create_timer(10), "timeout")
	queue_free()
