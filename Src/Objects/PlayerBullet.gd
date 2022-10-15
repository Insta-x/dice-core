extends RollBullet


func _ready() -> void:
	$Node2D.global_rotation = 0
	$Node2D/TextureRect/Label.text = str(roll)
