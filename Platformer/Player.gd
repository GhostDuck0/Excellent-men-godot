extends KinematicBody2D

export var move_speed := 100
export var gravity := 2000

var velocity := Vector2.ZERO

func _process(delta):
	velocity.y += gravity * delta

func _physics_process(delta: float) -> void:
	# reset horizontal velocity
	velocity.x = 0

	# set horizontal velocity
	if Input.is_action_pressed("move_right"):
		velocity.x += gravity * delta
	if Input.is_action_pressed("move_left"):
		velocity.x += gravity * delta
	if Input.is_action_pressed("move_up"):
		velocity.y -= gravity * delta
	if Input.is_action_pressed("move_down"):
		velocity.y += gravity * delta
 


	# apply gravity
	# player always has downward velocity
	 

	# actually move the player
	velocity = move_and_slide(velocity, Vector2.UP)
