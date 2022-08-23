extends DiceCoreLabel


func _ready() -> void:
	GlobalSignals.connect("critical_hit", self, "_on_critical_hit")
	GlobalSignals.connect("player_dice_rolled", self, "_on_dice_rolled")


func _on_critical_hit() -> void:
	timer.stop()
	show_true_seed()
