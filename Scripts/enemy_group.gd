extends Path2D

@export  var speed: float = 200
@onready var paths = get_children()

var is_in_screen = false
	
func _process(delta: float) -> void:
	if is_in_screen:
		for path in paths:
			if path is PathFollow2D:
				path.progress += speed * delta


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	is_in_screen = true
