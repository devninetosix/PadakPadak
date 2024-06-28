extends Node2D

@onready var up_pipe: Area2D = $UpPipe
@onready var down_pipe: Area2D = $DownPipe

const SPEED = -200.0
const GAP = 100.0

var left_edge = Vector2(0, 0);

func _ready() -> void:
	_reset()
	left_edge = DisplayServer.screen_get_size()
	up_pipe.position += Vector2.DOWN * GAP
	down_pipe.position += Vector2.UP * GAP
	

func _process(delta: float) -> void:
	if !GameManager.get_gameplay():
		return
	
	move_local_x(delta * SPEED)
	
	if position.x < -610:
		queue_free()
	

func _reset() -> void:
	position = Vector2(610, randi_range(-100, 100))
	up_pipe.position = Vector2(0, -310)
	down_pipe.position = Vector2(0, 310)
	
	
	

