extends Node2D

# spawner.gd

const PIPE = preload("res://nodes/gameplay/pipe.tscn")

var spawn_time := 1.5
var time_elapsed := 0.0

var can_spawn_pipes := false

func _ready() -> void:
	randomize()
	var game_manager = get_node("/root/GameManager")
	game_manager.connect("game_state_changed", Callable(self, "_on_game_state_changed"))


func _on_game_state_changed(state):
	match state:
		Enums.GAME_STATE.ON_PLAY:
			delete_all_pipes()
			can_spawn_pipes = true
		_:
			can_spawn_pipes = false


func _physics_process(delta: float) -> void:
	if can_spawn_pipes:
		time_elapsed += delta
		
		if time_elapsed > spawn_time:
			_spawn_pipe()
			time_elapsed = 0.0


func _spawn_pipe() -> void:
	var pipe = PIPE.instantiate()
	add_child(pipe)


func delete_all_pipes() -> void:
	var pipes = get_children()
	for pipe in pipes:
		pipe.queue_free()
