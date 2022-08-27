extends Pickupable

class_name PickupableDiceCore


export (Resource) var dice_core_resource = dice_core_resource as DiceCoreResource


func _ready() -> void:
	$Sprite.texture = dice_core_resource.small_dice_icon
	
	yield(get_tree().create_timer(10), "timeout")
	queue_free()
