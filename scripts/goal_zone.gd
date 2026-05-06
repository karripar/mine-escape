extends Area2D
@onready var ui = get_node("/root/Game/Canvas/WinCanvas")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.lock()

		print("You won!")

		# slow motion effect
		Engine.time_scale = 0.5

		# show UI 
		if ui:
			ui.show_win()
