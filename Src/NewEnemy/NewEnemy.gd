extends KinematicBody2D

class_name NewEnemy


export (int) var movespeed = 50

var player : Player


func goto(pos : Vector2, mundur := false) -> Vector2:
	look_at(pos)
	var d = pos - self.global_position
	if mundur: d = -d
	return move_and_slide(d.normalized() * movespeed * 2)