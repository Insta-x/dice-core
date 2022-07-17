extends DiceCoreResource

class_name AddMulterDiceCoreResource


export (int) var add_by := 0
export (int) var multiply_by := 1


func _formula(number: int) -> int:
	return (number + add_by) * multiply_by
