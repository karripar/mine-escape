extends Node2D

const SPEED = 40

var direction = 1
var dead = false

@onready var ray_right = $RayCastRight
@onready var ray_left = $RayCastLeft
@onready var ray_down_right = $RayCastDownRight
@onready var ray_down_left = $RayCastDownLeft
@onready var sprite = $AnimatedSprite2D


func _process(delta):
	if dead:
		return

	_handle_movement(delta)


func _handle_movement(delta):
	var new_direction = direction

	# WALLS
	if ray_right.is_colliding():
		new_direction = -1
	elif ray_left.is_colliding():
		new_direction = 1

	# EDGES
	elif direction == 1 and not ray_down_right.is_colliding():
		new_direction = -1
	elif direction == -1 and not ray_down_left.is_colliding():
		new_direction = 1

	direction = new_direction
	sprite.flip_h = direction == -1

	position.x += direction * SPEED * delta


func die():
	if dead:
		return

	dead = true

	# fully stop logic
	set_process(false)
	set_physics_process(false)

	direction = 0

	# disable collision
	var col = get_node_or_null("CollisionShape2D")
	if col:
		col.set_deferred("disabled", true)

	# STOP ANY CURRENT ANIMATION FIRST
	sprite.stop()

	# play death animation
	sprite.play("death")

	# wait until animation actually finishes
	await sprite.animation_finished

	queue_free()
