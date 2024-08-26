extends CharacterBody2D


@export var speed = 600.0

func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement
	var directionX := Input.get_axis("move_left", "move_right")
	var directionY := Input.get_axis("move_up", "move_dowm")
	
	velocity.x = directionX * speed
	velocity.y = directionY * speed

	move_and_slide()
