extends Node


# Global state of the game
var live = 3
var score = 0
var score_label: Label

func remove_live():
	if live > 1:
		live -= 1
	else:
		print("You lose")
		get_tree().reload_current_scene()
	print("Lives: ",live )


func add_points(value: int):
	score += value
	score_label.text = str(score)
	print("Score: ",score)
	
