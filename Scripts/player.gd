extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY: float = -900.0

# Instead of declaring a _ready() fn, we use @onready to create a variable that stores
# a reference of the AnimatedSprite2D node relative to the player scene tree.
@onready var ANIM_SPRITE_ref: AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Instead of getting gravity from project settings, we could instead create an 
# instance editable variable, using @export, in this case we define an arbitrary
# min/max range of values that are accepted, and the step size.
@export_range(0,1000000, 5) var gravity: float = 980

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the player movement.
	# This is an ok setup, but decoupling inputs is better for modularity
	# i.e - Input is in a separate script/class that sends signals for any other node that observes those signals.
	var direction = Input.get_axis("Left", "Right")
	
	# Instead of baking the spritesheet to have for each direction
	# just horizontally invert the sprite based on direction
	if direction > 0:
		ANIM_SPRITE_ref.flip_h = false # Point right
	elif direction < 0:
		ANIM_SPRITE_ref.flip_h = true # Point left
	

	# This is a basic way to handle animation, but there are better ways
	# One way is to use a Node that reads values from the player and uses state machines
	# to determine animations
	if is_on_floor():
		if direction != 0:
			ANIM_SPRITE_ref.play("walk")
		else:
			ANIM_SPRITE_ref.play("idle")
	else:
		ANIM_SPRITE_ref.play("idle")
	
	# This handles basic movement, but could be improved upon
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
