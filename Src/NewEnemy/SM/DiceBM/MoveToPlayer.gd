extends DiceBehaviour

onready var tween := $Tween
export (NodePath) onready var agent = get_node(agent) as NewEnemy
export (NodePath) onready var anim = get_node(anim) as AnimatedSprite

var dir := Vector2.ZERO
func enter() -> void:
	anim.speed_scale = 4
	tween.interpolate_property(agent, 'movespeed', 300, 0, 1)
	tween.start()
	dir = (agent.player.global_position - agent.global_position).normalized()

func update(delta: float) -> void:
	if dir != Vector2.ZERO:
		agent.goto(agent.global_position + dir * 1000)
	
