extends TimedCyclicState


export (NodePath) onready var agent = get_node(agent) as NewEnemy
export (NodePath) onready var animated_sprite = get_node(animated_sprite) as AnimatedSprite

onready var tween := $Tween

var dir := Vector2.ZERO


func enter() -> void:
	tween.interpolate_property(
		animated_sprite,
		"speed_scale",
		animated_sprite.speed_scale,
		4.0,
		2.0
	)
	tween.start()


func update(_delta: float) -> void:
	agent.look_at(agent.player.global_position)

