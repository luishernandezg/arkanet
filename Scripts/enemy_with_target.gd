extends Area2D

@export var  speed: float = 500.0
@onready var character = get_tree().get_nodes_in_group("characters")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var posicion_character = character[0].global_position
	global_position = global_position.move_toward(posicion_character ,speed*delta)
