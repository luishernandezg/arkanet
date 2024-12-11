extends Area2D

@export var  points: int = 50

var is_in_screen = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_explosion() -> void:
	collision_mask = 0
	collision_layer = 0
	$AnimatedSprite2D.animation = "explosion"
	await $AnimatedSprite2D.animation_finished
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	is_in_screen = true
