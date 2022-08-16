extends Node


onready var gui := $CanvasLayer/GUI
onready var tutorial_label := $CanvasLayer/TutorialLabel
onready var dice_set_explain := $CanvasLayer/DiceSetExplain
onready var enemy_gui_blocker := $World/DummyEnemyWrapper/EnemyGUIBlocker
onready var crit_hit_label := $World/CritHitLabel


func _ready() -> void:
	gui.set_dice_visibility(false)
	gui.set_hack_visibility(false)
	yield(get_tree().create_timer(2), "timeout")
	sequence_one()


func sequence_one() -> void:
	tutorial_label.display_text("Use mouse to aim\nPress LMB to shoot")
	yield(tutorial_label, "display_finished")
	
	yield(GlobalSignals, "player_shot")
	sequence_two()


func sequence_two() -> void:
	var base_text := "Bullet number is generated by your dice set"
	
	gui.set_dice_visibility(true)
	dice_set_explain.show()
	
	tutorial_label.display_text(base_text)
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(1), "timeout")
	
	tutorial_label.add_text("\nShoot 3 times to continue")
	yield(tutorial_label, "display_finished")
	
	yield(GlobalSignals, "player_shot")
	tutorial_label.text = base_text + "\nShoot 2 times to continue"
	
	yield(GlobalSignals, "player_shot")
	tutorial_label.text = base_text + "\nShoot 1 time to continue"
	
	yield(GlobalSignals, "player_shot")
	sequence_three()


func sequence_three() -> void:
	enemy_gui_blocker.hide()
	crit_hit_label.show()
	tutorial_label.display_text("Enemy's weakness number is generated by it's dice set")
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(1.5), "timeout")
	tutorial_label.add_text("\nThe weakness number is generated periodically")
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(0.5), "timeout")
	tutorial_label.add_text("\nGet a crit hit to continue")
	yield(tutorial_label, "display_finished")
	yield(GlobalSignals, "critical_hit")
	
	sequence_four()


func sequence_four() -> void:
	gui.set_hack_visibility(true)
	tutorial_label.display_text("You can inject hacked seed into enemy's dice core")
	yield(tutorial_label, "display_finished")
	yield(get_tree().create_timer(1), "timeout")
	tutorial_label.add_text("\nInject hack seed 13 to play the game")
