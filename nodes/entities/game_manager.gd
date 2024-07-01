extends Node2D

var curr_score := 0
var game_state := Enums.GAME_STATE.MENU

signal game_state_changed(state)

func _ready() -> void:
	set_game_state(Enums.GAME_STATE.MENU)
	connect("game_state_changed", Callable(self, "_on_game_state_changed"))

func get_game_state() -> Enums.GAME_STATE:
	return game_state

func set_game_state(state: Enums.GAME_STATE) -> void:
	if game_state == state:
		return
	game_state = state
	emit_signal("game_state_changed", state)

func _on_game_state_changed(state: Enums.GAME_STATE) -> void:
	match state:
		Enums.GAME_STATE.MENU:
			curr_score = 0
			emit_signal("reset_game")
			print("MENU")
		Enums.GAME_STATE.ON_PLAY:
			curr_score = 0
			print("PLAY")
		Enums.GAME_STATE.ON_DEAD:
			print("DEAD")

func add_score() -> void:
	curr_score += 1
	
func get_score() -> int:
	return curr_score
