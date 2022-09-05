extends VBoxContainer


func _ready() -> void:
	for child in get_children():
		child.init(randi() % 9 + 2)
