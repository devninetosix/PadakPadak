extends Node2D

static var is_playing := false

func _ready() -> void:
	is_playing = true


func set_gameplay(is_play: bool) -> void:
	is_playing = is_play

func get_gameplay() -> bool:
	return is_playing
