extends CharacterBody2D

# player.gd

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = %Area2D

const JUMP_STRENGTH := -200.0
const GRAVITY := 550.0
const TILT := 0.2
const MAX_ROTATION := 0.5
const ROTATION_LERP_SPEED := 6.0

var target_rotation := 0.0
var direction := Vector2(0, 0)
var is_playing := false

func _ready() -> void:
	animated_sprite_2d.play("default")
	area_2d.area_entered.connect(on_area_entered)
	var game_manager = get_node("/root/GameManager")
	game_manager.connect("game_state_changed", Callable(self, "_on_game_state_changed"))

func _on_game_state_changed(state):
	match state:
		Enums.GAME_STATE.ON_PLAY:
			position = Vector2(0, 50)
			velocity = Vector2.ZERO
			rotation = 0
			is_playing = true
		_:
			is_playing = false

func _process(delta: float) -> void:
	if !is_playing:
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
		
