extends AnimatedSprite2D

@export_file var nextLevel
@onready var character: Node = get_tree().get_first_node_in_group("characters")

func cinematic() -> void:
	Global.cinematic_is_playing = true
	var character_position = character.global_position
	var goal_position = $PositionAntena.global_position
	var exit_position = $PositionExit.global_position
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(character, "global_position", goal_position, 2).from_current()
	await tween.finished
	$GoalAnimationPlayer.play("goal")
	await $GoalAnimationPlayer.animation_finished
	var tween2: Tween = get_tree().create_tween()
	tween2.tween_property(character, "global_position", exit_position, 2).from(goal_position) 
	await tween2.finished
	Global.cinematic_is_playing = false
	get_tree().change_scene_to_file(nextLevel)

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	cinematic()
