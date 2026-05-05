extends Area2D

@export var hint_text: String = "Press jump to climb!"

@onready var ui = get_tree().get_root().get_node("Game/CanvasLayer")

func _on_body_entered(body):
	print("Enter:", body.name)
	if body.name == "Player":
		ui.show_hint(hint_text)

func _on_body_exited(body):
	if body.name == "Player":
		ui.hide_hint()
