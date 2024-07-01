extends CanvasLayer

@onready var restart_button: TextureButton = $RestartButton

func _ready() -> void:
	visible = false
	restart_button.pressed.connect(_on_restart_action)
	var game_manager = get_node("/root/GameManager")
	game_manager.connect("game_state_changed", Callable(self, "_on_game_state_changed"))

func _on_game_state_changed(state: Enums.GAME_STATE) -> void:
	visible = (state == Enums.GAME_STATE.ON_DEAD)

func _on_restart_action() -> void:
	GameManager.set_game_state(Enums.GAME_STATE.ON_PLAY)
