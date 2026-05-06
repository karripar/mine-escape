extends Area2D

@onready var enemy = get_parent()

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return

	if body.velocity.y > 0:
		enemy.die()
		
		body.velocity.y = -250
