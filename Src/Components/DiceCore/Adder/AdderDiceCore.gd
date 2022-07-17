extends DiceCoreResource

class_name AdderDiceCoreResource


export (int) var add_by := 0


func _formula(number: int) -> int:
	return number + add_by
