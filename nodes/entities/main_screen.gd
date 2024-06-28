extends CanvasLayer

@onready var play_button: TextureButton = %TextureButton


func _ready() -> void:
	play_button.pressed.connect(_on_play_action)
	

func _on_play_action() -> void:
	GameManager.set_game_state(Enums.GAME_STATE.ON_PLAY)
	


func _process(delta: float) -> void:
	if GameManager.get_game_state() == Enums.GAME_STATE.MENU:
		visible = true
	else:
		visible = false
