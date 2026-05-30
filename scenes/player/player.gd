extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var _animated_sprite = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction : int
	var y_direction : int 
	var animation = ""
	if Input.is_action_pressed("ui_right"):
		x_direction = 1
		animation = "walk_right"
	elif Input.is_action_pressed("ui_left"):
		x_direction = -1
		animation = "walk_left"
	
	if Input.is_action_pressed("ui_down"):
		y_direction = -1
		animation = "walk_front"
	
	elif Input.is_action_pressed("ui_up"):
		y_direction = 1
		animation = "walk_back"
		
	var buttons_pressed: bool = (
	Input.is_action_pressed("ui_right") || 
	Input.is_action_pressed("ui_left") || 
	Input.is_action_pressed("ui_down") || 
	Input.is_action_pressed("ui_up")
	)
	
	if ! buttons_pressed:
		x_direction = 0
		y_direction = 0
	
	velocity.x = x_direction * SPEED
	velocity.y = y_direction * SPEED
	
	velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
