extends Bullet

class_name HackBullet


export (int) var hack_seed := 0


func _ready() -> void:
	$Node2D.global_rotation = 0
	$Node2D/TextureRect/Label.text = str(hack_seed)
