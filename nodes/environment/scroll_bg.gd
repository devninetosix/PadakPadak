extends CanvasLayer

@onready var texture_rect: TextureRect = $TextureRect

var flow_mat: ShaderMaterial
var elapsed_time: float = 0.0

func _ready() -> void:
	flow_mat = texture_rect.material.duplicate() as ShaderMaterial
	texture_rect.material = flow_mat

func _process(delta: float) -> void:
	if GameManager.get_game_state() != Enums.GAME_STATE.ON_PLAY:
		return
	
	elapsed_time += delta
	flow_mat.set_shader_parameter("custom_time", elapsed_time)
