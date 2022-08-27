extends Pickupable

class_name PickupableIndexer


export (int) var start := 2


func _ready() -> void:
	$Sprite/Label.text = str(start)
	
	yield(get_tree().create_timer(10), "timeout")
	queue_free()
