extends TextureRect

class_name AnimatedRect


export (Array, Texture) var textures : Array
export (float) var time_between_frames := 0.5

onready var timer : Timer
var current_frame := 0 setget set_current_frame


func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = time_between_frames
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")
	
	self.current_frame = 0


func _on_timer_timeout() -> void:
	self.current_frame += 1


func set_current_frame(value: int) -> void:
	current_frame = value % textures.size()
	texture = textures[current_frame]
