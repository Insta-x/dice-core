extends Sprite


enum Follow {
	RIGID,
	ANIMATION,
}

export (NodePath) onready var rigid_path
#export (NodePath) onready var back_rigid = get_node(back_rigid) as RigidBody2D
export (NodePath) onready var animation_position_path
export (Follow) var follow := Follow.RIGID setget set_follow

onready var rigid : Node2D = get_node(rigid_path)
onready var animation_position : Node2D = get_node(animation_position_path)
onready var following : Node2D


func _ready() -> void:
	self.follow = Follow.RIGID


func _physics_process(delta: float) -> void:
	global_position = following.global_position
	global_rotation = following.global_rotation


func set_follow(value: int) -> void:
	follow = value
	
	match follow:
		Follow.RIGID:
			following = rigid
		Follow.ANIMATION:
			following = animation_position
