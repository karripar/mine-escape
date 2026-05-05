extends Node

@onready var score_label = $Control/ScoreLabel
@onready var hint_label = $HintControl/HintLabel

func _ready():
	GameManager.score_changed.connect(_on_score_changed)
	_on_score_changed(GameManager.score)

	# hide hint at start
	hint_label.visible = false

func _on_score_changed(score):
	score_label.text = "Coins: " + str(score) + "/16"

# logic for showing hints to the user
func show_hint(text):
	hint_label.text = text
	hint_label.visible = true

func hide_hint():
	hint_label.visible = false
