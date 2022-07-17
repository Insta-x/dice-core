extends Resource

class_name DiceCoreResource


export (Texture) var dice_icon
export (Texture) var small_dice_icon
export (Color) var color := Color(1, 1, 1)

# Override for different DiceCoreResource
func _formula(number: int) -> int:
	return number
