extends DiceCoreResource

class_name MultAdderDiceCoreResource


export (int) var multiply_by := 1
export (int) var add_by := 0


func _formula(number: int) -> int:
	return number * multiply_by + add_by
