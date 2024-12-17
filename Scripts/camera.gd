extends Camera2D

@export var speed: float = 600.0

# Camera movement
func _physics_process(delta: float) -> void:
	if !Global.cinematic_is_playing:	
		position.x += speed*delta
