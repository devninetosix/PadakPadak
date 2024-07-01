extends CanvasLayer

# main_screen.gd

@onready var play_button: TextureButton = %TextureButton


func _ready() -> void:
	play_button.pressed.connect(_on_play_action)
	var game_manager = get_node("/root/GameManager")
	game_manager.connect("game_state_changed", Callable(self, "_on_game_state_changed"))

func _on_game_state_changed(state):
	match state:
		Enums.GAME_STATE.MENU:
			visible = true
		_:
			visible = false
	

func _on_play_action() -> void:
	GameManager.set_game_state(Enums.GAME_STATE.ON_PLAY)
	

