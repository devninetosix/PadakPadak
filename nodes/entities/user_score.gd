extends CanvasLayer

@onready var rich_text_label: RichTextLabel = $RichTextLabel

func _process(delta: float) -> void:
	if GameManager.get_game_state() == Enums.GAME_STATE.MENU:
		rich_text_label.hide()
	else:
		rich_text_label.show()
	
	rich_text_label.text = "[center]" + str(GameManager.get_score()) + "[/center]"
	
