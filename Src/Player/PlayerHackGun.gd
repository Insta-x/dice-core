extends Node2D


const bullet_scn := preload("res://Src/Objects/HackBullet.tscn")

export (Vector2) var emit_offset

onready var timer := $Timer

var can_shoot := true
var hack_seed := 1 setget set_hack_seed


func _ready() -> void:
	GlobalSignals.connect("critical_hit", self, "_on_critical_hit")


func shoot() -> void:
	if not can_shoot:
		return
	
	can_shoot = false
	
	var bullet : HackBullet = bullet_scn.instance()
	bullet.global_rotation = global_rotation
	bullet.global_position = global_position + emit_offset.rotated(global_rotation)
	bullet.hack_seed = hack_seed
	owner.get_parent().add_child(bullet)
	
	GlobalSignals.emit_signal("player_hack_shot")
	
	timer.start()


func _on_critical_hit() -> void:
	can_shoot = true
	timer.stop()


func set_hack_seed(value: int) -> void:
	hack_seed = value
	GlobalSignals.emit_signal("player_hack_seed_changed", hack_seed)



func _on_PlayerWrapper_hack_input(shoot: bool, add_seed: int) -> void:
	if shoot:
		shoot()
	
	self.hack_seed = (hack_seed + add_seed) % 20


func _on_Timer_timeout() -> void:
	can_shoot = true
