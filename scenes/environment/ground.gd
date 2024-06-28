extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
@onready var sprite_2d_3: Sprite2D = $Sprite2D3

var sprite_list: Array[Sprite2D] = []

var flow_mat: ShaderMaterial
var elapsed_time: float = 0.0

func _ready() -> void:
	flow_mat = sprite_2d.material.duplicate() as ShaderMaterial
	
	sprite_list = [
		sprite_2d,
		sprite_2d_2,
		sprite_2d_3,
	]
	
	for item in sprite_list:
		item.material = flow_mat

func _process(delta: float) -> void:
	if !GameManager.get_gameplay():
		return
	
	elapsed_time += delta
	flow_mat.set_shader_parameter("custom_time", elapsed_time)
