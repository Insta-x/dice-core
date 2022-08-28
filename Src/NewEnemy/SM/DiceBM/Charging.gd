extends DiceBehaviour

onready var tween := $Tween
export (NodePath) onready var agent = get_node(agent) as NewEnemy
export (NodePath) onready var anim = get_node(anim) as AnimatedSprite

var dir := Vector2.ZERO
func enter() -> void:
	anim.speed_scale = 2
	print("charge")
	dir = (agent.player.global_position - agent.global_position).normalized()
	tween.interpolate_property(agent, 'global_rotation', agent.global_rotation, dir.angle() , 1)
	tween.start()
	
	agent.look_at(agent.player.global_position)

