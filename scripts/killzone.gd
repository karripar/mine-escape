extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return

	var enemy = get_parent()

	if "dead" in enemy and enemy.dead:
		return

	Engine.time_scale = 0.5
	body.die()
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	GameManager.reset()
	get_tree().reload_current_scene()
