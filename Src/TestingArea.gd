extends Node


onready var gui := $CanvasLayer/GUI
onready var tutorial_label := $CanvasLayer/TutorialLabel
onready var enemy_gui_blocker := $World/DummyEnemyWrapper/EnemyGUIBlocker
onready var crit_hit_explain := $World/CritHitExplain

onready var input_blocker := $InputBlocker


func _ready() -> void:
	GlobalSignals.connect("tutorial_complete", self, "complete")
	
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
	
	$CanvasLayer/DiceSetExplain/Label4.show()
	$CanvasLayer/DiceSetExplain/TextureRect4.show()
	
	gui.set_dice_visibility(true)
	
	tutorial_label.display_text("Bullet number is generated by your dice set")
	yield(tutorial_label, "display_finished")
#
	yield(get_tree().create_timer(1), "timeout")
#
	tutorial_label.add_text("\nShoot to continue")
	yield(tutorial_label, "display_finished")
#
	yield(GlobalSignals, "player_shot")
	
	sequence_two_one()


func sequence_two_one() -> void:
	# Teaching about dice seed
	
	$CanvasLayer/DiceSetExplain/Label4.modulate.a = 0.5
	$CanvasLayer/DiceSetExplain/TextureRect4.modulate.a = 0.5
	
	$CanvasLayer/DiceSetExplain/Label3.show()
	$CanvasLayer/DiceSetExplain/TextureRect3.show()
	
	tutorial_label.display_text("Dice seed is the number inside dice core")
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(1), "timeout")
	
	tutorial_label.add_text("\nShoot to continue")
	yield(tutorial_label, "display_finished")
	
	yield(GlobalSignals, "player_shot")
	
	sequence_two_two()


func sequence_two_two() -> void:
	# Teaching how dice core generate new seed
	
	tutorial_label.display_text("Dice core will generate new dice seed from current dice seed")
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(1), "timeout")
	
	tutorial_label.add_text("\nShoot to continue")
	yield(tutorial_label, "display_finished")
	
	yield(GlobalSignals, "player_shot")
	
	sequence_two_three()


func sequence_two_three() -> void:
	# Teaching how Limiter works
	
	$CanvasLayer/DiceSetExplain/Label3.modulate.a = 0.5
	$CanvasLayer/DiceSetExplain/TextureRect3.modulate.a = 0.5
	
	$CanvasLayer/DiceSetExplain/Label2.show()
	$CanvasLayer/DiceSetExplain/TextureRect2.show()
	
	tutorial_label.display_text("Limiter will prevent the dice seed from going higher than itself")
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(1), "timeout")
	
	tutorial_label.add_text("\nShoot to continue")
	yield(tutorial_label, "display_finished")
	
	yield(GlobalSignals, "player_shot")
	
	sequence_two_four()


func sequence_two_four() -> void:
	# Teaching how Indexer works
	
	$CanvasLayer/DiceSetExplain/Label2.modulate.a = 0.5
	$CanvasLayer/DiceSetExplain/TextureRect2.modulate.a = 0.5
	
	$CanvasLayer/DiceSetExplain/Label.show()
	$CanvasLayer/DiceSetExplain/TextureRect.show()
	
	tutorial_label.display_text("Indexer will generate bullet number by adding it's number to the dice seed")
	yield(tutorial_label, "display_finished")
	
	yield(get_tree().create_timer(1), "timeout")
	
	tutorial_label.add_text("\nShoot to continue")
	yield(tutorial_label, "display_finished")
	
	yield(GlobalSignals, "player_shot")
	
	sequence_three()


func sequence_three() -> void:
	# Teaching dash
	
	$CanvasLayer/DiceSetExplain/Label.modulate.a = 0.5
	$CanvasLayer/DiceSetExplain/TextureRect.modulate.a = 0.5
	
	var base_text := "Press spacebar to dash"
	var second_text := "\nYour dice set will generate new bullet number when you dash"
	
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


func complete() -> void:
	get_tree().change_scene("res://Src/Game.tscn")
