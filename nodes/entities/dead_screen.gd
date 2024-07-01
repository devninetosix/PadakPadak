extends CanvasLayer

# dead_screen.gd

@onready var restart_button: TextureButton = $RestartButton


func _ready() -> void:
	restart_button.pressed.connect(_on_restart_action)


func _process(_delta: float) -> void:
	if GameManager.get_game_state() == Enums.GAME_STATE.ON_DEAD:
		visible = true
	else:
		visible = false


func _on_restart_action() -> void:
	GameManager.set_game_state(Enums.GAME_STATE.ON_PLAY)
