extends Node

var score := 0
var max_coins := 2

signal score_changed(score)
signal all_coins_collected

func add_score(amount):
	score += amount
	score_changed.emit(score)
	
	if score >= max_coins:
		all_coins_collected.emit()
