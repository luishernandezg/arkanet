extends Path2D

@export  var speed: float = 500

@onready var paths = get_children()
	
func _process(delta: float) -> void:
	for path: PathFollow2D in paths:
		path.progress += speed * delta
