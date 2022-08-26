extends Node


onready var gui := $CanvasLayer/GUI
onready var tutorial_label := $CanvasLayer/TutorialLabel
onready var dice_set_explain := $CanvasLayer/DiceSetExplain
onready var enemy_gui_blocker := $World/DummyEnemyWrapper/EnemyGUIBlocker
onready var crit_hit_explain := $World/CritHitExplain

onready var input_blocker := $InputBlocker


func _ready() -> void:
	gui.set_dice_visibility(false)
	gui.set_hack_visibility(false)
	gui.set_shoot_visibility(false)
	yield(get_tree().create_timer(2), "timeout")
	
	sequence_one()


func sequence_one() -> void:
	# Teaching how to shoot
	
	tutorial_label.display_text("Use mouse to aim\nPress LMB to shoot")
	yield(tutorial_label, "display_finished")
	gui.set_shoot_visibility(true)
	input_blocker.block_press.remove(0)
	
	yield(GlobalSignals, "player_shot")
	
	sequence_two()


func sequence_two() -> void:
	# Teaching how dice set generate bullet number
	
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
	# Teaching dash
	
	var base_text := "Press spacebar to dash"
	var second_text := "\nYour dice set will generate new bullet number if you dash"
	
	tutorial_label.display_text(base_text)
	yield(tutorial_label, "display_finished")
	input_blocker.block_press.remove(0)
	
	yield(GlobalSignals, "player_dashed")
	tutorial_label.add_text(second_text)
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(1), "timeout")
	
	tutorial_label.add_text("\nDash 3 times to continue")
	yield(tutorial_label, "display_finished")
	
	yield(GlobalSignals, "player_dashed")
	tutorial_label.text = base_text + second_text + "\nDash 2 times to continue"
	
	yield(GlobalSignals, "player_dashed")
	tutorial_label.text = base_text + second_text + "\nDash 1 time to continue"
	
	yield(GlobalSignals, "player_dashed")
	
	sequence_four()


func sequence_four() -> void:
	# Teaching enemy weakness number
	
	enemy_gui_blocker.hide()
	$World/DummyEnemyWrapper/DiceTimer.start()
	crit_hit_explain.show()
	tutorial_label.display_text("Enemy's weakness number is generated by it's dice set")
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(0.5), "timeout")
	tutorial_label.add_text("\nThe weakness number is generated periodically")
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(1), "timeout")
	tutorial_label.add_text("\nGet a crit hit to continue")
	yield(tutorial_label, "display_finished")
	yield(GlobalSignals, "critical_hit")
	
	sequence_five()


func sequence_five() -> void:
	# Teaching hack
	
	gui.set_hack_visibility(true)
	tutorial_label.display_text("You can inject hacked seed into enemy's dice core")
	input_blocker.block_press.clear()
	input_blocker.block_release.clear()
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(1), "timeout")
	tutorial_label.add_text("\nInject hack seed 6 to play the game")
