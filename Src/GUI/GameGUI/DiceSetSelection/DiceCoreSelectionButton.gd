extends TextureButton


export (Resource) var dice_core_resource = dice_core_resource as DiceCoreResource


func _ready() -> void:
	if pressed:
		modulate = 0x00c9ffff
		GlobalSignals.emit_signal("dice_core_selected", dice_core_resource)


func _toggled(button_pressed: bool) -> void:
	if button_pressed:
		modulate = 0x00c9ffff
		GlobalSignals.emit_signal("dice_core_selected", dice_core_resource)
	else:
		modulate = Color.white
