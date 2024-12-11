extends Area2D

@export var  speed: float = 500.0
@export var  points: int = 50
@onready var character = get_tree().get_nodes_in_group("characters")

var is_in_screen = false

func set_explosion() -> void:
	collision_mask = 0
	collision_layer = 0
	$AnimatedSprite2D.animation = "explosion"
	await $AnimatedSprite2D.animation_finished
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if is_in_screen:
		var posicion_character = character[0].global_position
		global_position = global_position.move_toward(posicion_character ,speed*delta)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	is_in_screen = true
