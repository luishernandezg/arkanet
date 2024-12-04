extends CharacterBody2D

@export var speed: float = 600.0
@onready var shot = preload("res://Scenes/shot.tscn")
@onready var playback: AnimationNodeStateMachinePlayback = $AnimationTree.get("parameters/playback")
@onready var parent = get_parent()

var cooldown = true

func _physics_process(_delta: float) -> void:
	
	# Get the input direction and handle the movement
	var directionX := Input.get_axis("move_left", "move_right")
	var directionY := Input.get_axis("move_up", "move_dowm")
	
	if(velocity == Vector2.ZERO):
		playback.start('RESET')
		
	if(directionX < 0):
		playback.travel('move_left')
		
	if(directionX > 0):
		playback.travel('move_right')
	
	# Test damage animation with z 
	if Input.is_action_pressed("damage_test"):
		playback.travel('damage')
		
	if (Input.is_action_pressed("attack")):
		shot_action()
		
	velocity.x = directionX * speed
	velocity.y = directionY * speed

	move_and_slide()
	
func shot_action() -> void:
	if cooldown:
		cooldown = false
		$Timer.start()
		var shot_isntance = shot.instantiate()
		shot_isntance.position = $ShotPos.global_position
		parent.add_child(shot_isntance)
	


func _on_timer_timeout() -> void:
	cooldown = true
