extends Node2D

# game_manager.gd

var curr_score := 0
var game_state := Enums.GAME_STATE.MENU

signal game_state_changed(state)

func _ready() -> void:
	set_game_state(Enums.GAME_STATE.MENU)
	connect("game_state_changed", Callable(self, "_on_game_state_changed"))

func get_game_state() -> Enums.GAME_STATE:
	return game_state

func set_game_state(state: Enums.GAME_STATE) -> void:
	game_state = state
	emit_signal("game_state_changed", state)

func _on_game_state_changed(state: Enums.GAME_STATE) -> void:
	match state:
		Enums.GAME_STATE.MENU:
			# 게임 점수 초기화
			# 파이프 전부 제거
			# 플레이어 원위치 or 제거
			print("MENU")
		Enums.GAME_STATE.ON_PLAY:
			# 게임 플레이 할 수 있게끔
			curr_score = 0
			print("PLAY")
		Enums.GAME_STATE.ON_DEAD:
			# 전부 멈추기
			print("DEAD")

# 점수 UI에서 호출 (signal로 해야하는데..)
func add_score() -> void:
	curr_score += 1
	
func get_score() -> int:
	return curr_score
