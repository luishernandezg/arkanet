extends Camera2D

@export var speed: float = 600.0

# Camera movement
func _physics_process(delta: float) -> void:
	position.x += speed*delta
