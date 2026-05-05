extends Area2D

func _on_body_entered(body):
	print("coin")
	GameManager.add_score(1)
	queue_free()
