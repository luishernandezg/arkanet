extends CharacterBody2D

@export var speed: float = 600.0
@onready var shot = preload("res://Scenes/shot.tscn")
@onready var specialShot = preload("res://Scenes/spesial_shot.tscn")
@onready var playback: AnimationNodeStateMachinePlayback = $AnimationTree.get("parameters/playback")
@onready var animationPlayer: AnimationPlayer = $AnimationPlayerDamage
@onready var hub: Node = get_tree().get_first_node_in_group("HUB")
var cooldown = true
var powerUp = false

func _ready() -> void:
	Global.live = 3
	Global.score = 0
	Global.score_label = hub.get_node("ScoreBar/Label")

func _physics_process(_delta: float) -> void:
	if !Global.cinematic_is_playing:	
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
			animationPlayer.play("damage")
			
		if (Input.is_action_pressed("attack")):
			if powerUp:
				special_shot_action()
			else: 
				shot_action()
			
		velocity.x = directionX * speed
		velocity.y = directionY * speed
		
		move_and_slide()
		if is_on_wall():
			print("COLIDE")
			take_damage()
		
	
func shot_action() -> void:
	if cooldown:
		cooldown = false
		$Timer.start()
		$ShootSound.play()
		var shot_isntance: Node2D = shot.instantiate()
		shot_isntance.position = $ShotPos.global_position
		add_child(shot_isntance)
		# with top_level set to true the shot isntance is no afected by his parent
		shot_isntance.top_level = true
		
func special_shot_action() -> void:
	if cooldown:
		cooldown = false
		$Timer.start()
		$ShootSound.play()
		var shot_isntance: Node2D = specialShot.instantiate()
		shot_isntance.position = $ShotPos.global_position
		add_child(shot_isntance)
		# with top_level set to true the shot isntance is no afected by his parent
		shot_isntance.top_level = true
	
func take_damage() -> void:
	Global.remove_live()
	var lifeBar: TextureRect  = hub.get_node("LifeBar")
	var lifes: Array[Node] = lifeBar.get_children()
	lifes[Global.live].visible = false
	animationPlayer.play("damage")

func _on_timer_timeout() -> void:
	cooldown = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemigo"):
		take_damage()
		area.set_explosion()
