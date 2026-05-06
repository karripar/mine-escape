extends Node

var score := 0
var max_coins := 16

signal score_changed(score)
signal all_coins_collected

func reset():
	print("RESET CALLED")
	score = 0
	score_changed.emit(score)

func add_score(amount):
	score += amount
	score_changed.emit(score)
	
	if score >= max_coins:
		all_coins_collected.emit()
