extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var animationPlayer: AnimationPlayer = $AnimationMontain
	animationPlayer.play("gear")
	pass # Replace with function body.
