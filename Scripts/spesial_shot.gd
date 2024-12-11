extends Node2D

func _physics_process(_delta: float) -> void:
	# Free memory when the node dont have child
	if get_child_count() == 0:
		queue_free()
	pass
