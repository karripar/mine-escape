extends Node

@onready var hint_label = $HintContainer/HintLabel
@onready var color_rect = $ColorRect

func _ready():
	hint_label.visible = false
	color_rect.visible = false

# logic for showing hints to the user
func show_hint(text):
	hint_label.text = text
	hint_label.visible = true
	color_rect.visible = true

func hide_hint():
	hint_label.visible = false
	color_rect.visible = false
