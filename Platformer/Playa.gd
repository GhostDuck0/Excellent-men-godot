extends KinematicBody2D

export var move_speed := 100
export var gravity := 50
export var gravityx := 0
var velocity := Vector2.ZERO

func _physics_process(delta: float) -> void:
	# reset horizontal velocity
	velocity.x = 0

	# set horizontal velocity
	if Input.is_action_pressed("move_right"):
		if is_on_ceiling():
			gravityx = 2000
			gravity = 0
	if Input.is_action_pressed("move_left"):
		if is_on_ceiling():
			gravityx = -2000
			gravity = 0
	if Input.is_action_pressed("move_up"):
		if is_on_ceiling():
			gravity = -200
			gravityx = 0
	if Input.is_action_pressed("move_down"):
		if is_on_ceiling():
			gravity = 200 
			gravityx = 0
	if Input.is_action_pressed("move_right"):
		if is_on_floor():
			gravityx = 2000
			gravity = 0
	if Input.is_action_pressed("move_left"):
		if is_on_floor():
			gravityx = -2000
			gravity = 0
	if Input.is_action_pressed("move_up"):
		if is_on_floor():
			gravity = -200
			gravityx = 0
	if Input.is_action_pressed("move_down"):
		if is_on_floor():
			gravity = 200 
			gravityx = 0
	if Input.is_action_pressed("move_right"):
		if is_on_wall():
			gravityx = 2000
			gravity = 0
	if Input.is_action_pressed("move_left"):
		if is_on_wall():
			gravityx = -2000
			gravity = 0
	if Input.is_action_pressed("move_up"):
		if is_on_wall():
			gravity = -200
			gravityx = 0
	if Input.is_action_pressed("move_down"):
		if is_on_wall():
			gravity = 200 
			gravityx = 0
	 
	# apply gravity
	# player always has downward velocity
	velocity.y += gravity 
	velocity.x += gravityx 

	# actually move the player
	velocity = move_and_slide(velocity, Vector2.UP)
