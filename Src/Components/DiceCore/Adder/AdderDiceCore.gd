extends DiceCoreResource

class_name AdderDiceCoreResource


export (int) var add_by := 0


func _formula(number: int) -> int:
	return number + add_by


func _check_limiter(lower_limit: int, upper_limit: int) -> int:
	if add_by == upper_limit - lower_limit + 1:
		return 1
	return 0
