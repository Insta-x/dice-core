extends KinematicBody2D

class_name NewEnemy

onready var spriteWrapper := $SpriteWrapper

export (int) var movespeed = 50

var player : Player

func goto(pos : Vector2, mundur := false) -> Vector2:
	look_at(pos)
	var d = pos - self.global_position
	if mundur: d = -d
	return move_and_slide(d.normalized() * movespeed * 2)

func goto2(pos : Vector2, delta:float, mundur := false) -> KinematicCollision2D:
	look_at(pos)
	var d = pos - self.global_position
	if mundur: d = -d
	return move_and_collide(d.normalized() * movespeed * 2 * delta)
