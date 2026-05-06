extends Node

@onready var score_label = $ScoreContainer/ScoreLabel

func _ready():
	if not GameManager.score_changed.is_connected(_on_score_changed):
		GameManager.score_changed.connect(_on_score_changed)

	_on_score_changed(GameManager.score)

func _on_score_changed(score):
	print("UI UPDATE: ", score)
	score_label.text = "Coins: " + str(score) + "/16"
