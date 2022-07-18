extends Node2D


export (NodePath) onready var body = get_node(body) as NewEnemy


func _on_behaviour_changed(behaviour_name: String) -> void:
	$EnemyGUI/VBoxContainer/BehaviourLabel.text = behaviour_name
	if (behaviour_name == "self destruct"):
		$EnemyGUI/VBoxContainer/BehaviourLabel.set("custom_colors/font_color", Color(1,0,0))
	else:
		$EnemyGUI/VBoxContainer/BehaviourLabel.set("custom_colors/font_color", Color(0,0,0))


func _on_health_changed(value: int) -> void:
	$EnemyGUI/VBoxContainer/HBoxContainer/Health/Label.text = str(value)


func _on_DiceWrapper_dice_rolled(number: int) -> void:
	$EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/DiceCore/RollLabel.roll(number)


func _on_DiceWrapper_dice_core_changed(resource: DiceCoreResource) -> void:
	$EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/DiceCore.texture = resource.small_dice_icon
	$EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/DiceCore.self_modulate = resource.color


func _on_DiceWrapper_limiter_changed(lower_limit: int, upper_limit: int) -> void:
	$EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/LowerLimit/Label.text = str(lower_limit)
	$EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/UpperLimit/Label.text = str(upper_limit)


func _on_DiceWrapper_number_changed(number: int) -> void:
	$EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/DiceCore/RollLabel.change_number(number)


func _physics_process(delta: float) -> void:
	global_rotation = 0
	if body:
		global_position = body.global_position

