extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0

var last_dir = ""

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction : int
	var y_direction : int 
	var animation = ""
	
	#region Movement Controls
	var direction := Vector2.ZERO

	if Input.is_action_pressed("walk_right"):
		animation = "walk_right"
		last_dir = "right"
		direction.x += 1
	if Input.is_action_pressed("walk_left"):
		animation = "walk_left"
		last_dir = "left"
		direction.x -= 1
	if Input.is_action_pressed("walk_forward"):
		animation = "walk_front"
		last_dir = "front"
		direction.y += 1
	if Input.is_action_pressed("walk_back"):
		animation = "walk_back"
		last_dir = "back"
		direction.y -= 1
		
	velocity = direction.normalized() * SPEED
	#if Input.is_action_pressed("ui_right"):
		##print("Put a dope ass wizard tower on it")
		#x_direction = 1
		#
		#
	#if Input.is_action_pressed("ui_left"):
		#x_direction = -1
		#
		#
	#if Input.is_action_pressed("ui_down"):
		#y_direction = 1
		#
		#
	#if Input.is_action_pressed("ui_up"):
		#y_direction = -1
		
		
	var buttons_pressed: bool = (
	Input.is_action_pressed("walk_right") || 
	Input.is_action_pressed("walk_left") || 
	Input.is_action_pressed("walk_forward") || 
	Input.is_action_pressed("walk_back")
	)
	
	if ! buttons_pressed:
		#print("THIS SHIT SUCKS.")
		x_direction = 0
		y_direction = 0
		animation = "idle_" + last_dir
	#endregion
	
	_animated_sprite.play(animation)
	position.x += x_direction * SPEED * delta
	position.y += y_direction * SPEED * delta
	
	# Inventory Controls
	#if Input.is_action_pressed("inventory"):
		

	move_and_slide()
