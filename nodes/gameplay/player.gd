extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = %Area2D

const JUMP_STRENGTH := -200.0
const GRAVITY := 550.0
const TILT := 0.2
const MAX_ROTATION := 0.5
const ROTATION_LERP_SPEED := 6.0

var target_rotation := 0.0
var direction := Vector2(0, 0)

func _ready() -> void:
	animated_sprite_2d.play("default")
	area_2d.area_entered.connect(on_area_entered)


func _process(delta: float) -> void:
	if GameManager.get_game_state() != Enums.GAME_STATE.ON_PLAY:
		return
	
	if Input.is_action_pressed("InputEnter"):
		velocity.y = JUMP_STRENGTH
	
	velocity.y += GRAVITY * delta
	target_rotation = clamp(velocity.y * TILT, -MAX_ROTATION, MAX_ROTATION)
	rotation = lerp(rotation, target_rotation, ROTATION_LERP_SPEED * delta)
	
	move_and_slide()

func on_area_entered(other_area: Area2D) -> void:
	if other_area.name.contains("Pipe") or other_area.name.contains("Ground"):
		GameManager.set_game_state(Enums.GAME_STATE.ON_DEAD);
		return;
	
	if other_area.name.contains("Score"):
		GameManager.add_score()
		
