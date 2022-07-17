extends Resource

class_name DiceCoreResource


export (Texture) var dice_icon

# Override for different DiceCoreResource
func _formula(number: int) -> int:
	return number
