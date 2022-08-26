extends Node2D


export (NodePath) onready var body = get_node(body) as NewEnemy

onready var indexer_label := $EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/Indexer/Label
onready var limiter_label := $EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/Limiter/Label
onready var indexer_hacked_label := $EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/Indexer/HackedLabel
onready var limiter_hacked_label := $EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/Limiter/HackedLabel
onready var health_label := $EnemyGUI/VBoxContainer/HBoxContainer/MarginContainer/HealthContainer/Health/Label
onready var dice_core_rect := $EnemyGUI/VBoxContainer/HBoxContainer/HBoxContainer/MarginContainer/DiceCore


func _physics_process(delta: float) -> void:
	global_rotation = 0
	if body:
		global_position = body.global_position


func hacked() -> void:
	indexer_hacked_label.show()
	limiter_hacked_label.show()
	limiter_label.modulate.a = 0.5
	indexer_label.modulate.a = 0.5
	yield(get_tree().create_timer(0.85), "timeout")
	indexer_hacked_label.hide()
	limiter_hacked_label.hide()
	limiter_label.modulate.a = 1
	indexer_label.modulate.a = 1


func _on_health_changed(value: int) -> void:
	health_label.text = str(value)


func _on_DiceWrapper_dice_core_changed(resource: DiceCoreResource) -> void:
	dice_core_rect.texture = resource.small_dice_icon


func _on_DiceWrapper_limiter_changed(new_limit: int) -> void:
	limiter_label.text = str(new_limit)


func _on_DiceWrapper_indexer_changed(new_indexer: int) -> void:
	indexer_label.text = str(new_indexer)

