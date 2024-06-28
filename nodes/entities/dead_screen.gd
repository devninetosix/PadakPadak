extends CanvasLayer


func _process(_delta: float) -> void:
	if GameManager.get_game_state() == Enums.GAME_STATE.ON_DEAD:
		visible = true
	else:
		visible = false
