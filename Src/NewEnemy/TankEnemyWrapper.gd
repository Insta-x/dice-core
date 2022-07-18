extends EnemyWrapper


onready var health := $EnemyHealth


func _ready() -> void:
	var immune_rand := randi() % 5
	
	match immune_rand:
		0:
			health.immune_to_same = true
		1:
			health.immune_to_less = true
		2:
			health.immune_to_more = true
		3:
			health.immune_to_even = true
		4:
			health.immune_to_odd = true
