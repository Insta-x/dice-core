extends TimedCyclicState


export (NodePath) onready var agent = get_node(agent) as NewEnemy
export (NodePath) onready var animated_sprite = get_node(animated_sprite) as AnimatedSprite

onready var tween := $Tween

var dir := Vector2.ZERO


func enter() -> void:
	tween.interpolate_property(agent, 'movespeed', 300, 0, 1)
	tween.interpolate_property(
		animated_sprite,
		"speed_scale",
		animated_sprite.speed_scale,
		0.0,
		1.5
	)
	tween.start()
	dir = (agent.player.global_position - agent.global_position).normalized()


func update(_delta: float) -> void:
	agent.goto(agent.global_position + dir * 1000)
	
