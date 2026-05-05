extends Node

@onready var score_label = $Control/Label

func _ready():
	GameManager.score_changed.connect(_on_score_changed)
	_on_score_changed(GameManager.score)

func _on_score_changed(score):
	print("score changed " + str(score))
	score_label.text = "Coins: " + str(score) + "/16"
