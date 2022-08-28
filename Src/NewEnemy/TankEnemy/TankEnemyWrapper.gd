extends EnemyWrapper


onready var health := $EnemyHealth
onready var immune_label := $TankEnemy/ImmuneLabel


func _ready() -> void:
	var immune_rand := randi() % 5
	
	match immune_rand:
		0:
			health.immune_to_same = true
			immune_label.text = "="
		1:
			health.immune_to_less = true
			immune_label.text = "-"
		2:
			health.immune_to_more = true
			immune_label.text = "+"
		3:
			health.immune_to_even = true
			immune_label.text = "0"
		4:
			health.immune_to_odd = true
			immune_label.text = "1"
