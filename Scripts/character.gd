extends CharacterBody2D


@export var speed = 600.0

@onready var playback: AnimationNodeStateMachinePlayback = $AnimationTree.get("parameters/playback")

func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement
	var directionX := Input.get_axis("move_left", "move_right")
	var directionY := Input.get_axis("move_up", "move_dowm")
	
	if(velocity == Vector2.ZERO):
		playback.start('RESET')
		
	if(directionX < 0):
		playback.travel('move_left')
		
	if(directionX > 0):
		playback.travel('move_right')
		
	velocity.x = directionX * speed
	velocity.y = directionY * speed

	move_and_slide()
