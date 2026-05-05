extends Node2D

@onready var animation_player = $AnimationPlayer

func _ready():
	GameManager.all_coins_collected.connect(_on_all_coins)

func _on_all_coins():
	animation_player.play("activate")
