extends DiceCoreResource

class_name MultiplierDiceCoreResource


export (int) var multiply_by := 1


func _formula(number: int) -> int:
	return number * multiply_by
