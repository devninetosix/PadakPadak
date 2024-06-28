extends Node2D

const PIPE = preload("res://nodes/gameplay/pipe.tscn")

var spawn_time := 1.5
var time_elapsed := 0.0

func _ready() -> void:
	randomize()


func _physics_process(delta: float) -> void:
	if GameManager.get_game_state() != Enums.GAME_STATE.ON_PLAY:
		return
	
	time_elapsed += delta
	
	if time_elapsed > spawn_time:
		spawn_pipe()
		time_elapsed = 0.0

func spawn_pipe() -> void:
	var pipe = PIPE.instantiate()
	add_child(pipe)
