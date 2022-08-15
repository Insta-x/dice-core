extends Control


func _ready() -> void:
	GlobalSignals.connect("player_died", self, "hide")
	GlobalSignals.connect("time_over", self, "hide")


func set_dice_visibility(value: bool) -> void:
	$DiceCoreContainer.visible = value


func set_shoot_visibility(value: bool) -> void:
	$LeftClickAnimatedRect.visible = value
	$ShootLabel.visible = value
	$GunContainer.visible = value


func set_hack_visibility(value: bool) -> void:
	$RightClickAnimatedRect.visible = value
	$HackLabel.visible = value
	$HackContainer.visible = value
	$ScrollAnimatedRect.visible = value
