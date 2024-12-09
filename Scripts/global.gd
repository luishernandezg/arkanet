extends Node


# Global state of the game
var live = 0
var score = 0

func remove_live():
	if live > 1:
		live -= 1
	else:
		print("You lose")
	print("Lives: ",live )


func add_points(value: int):
	score += value
	print("Score: ",score)
	
