extends CanvasLayer

@onready var label = $CenterContainer/DeathLabel
@onready var color_rect = $ColorRect

func _ready():
	label.visible = false
	color_rect.visible = false

func show_death():
	label.text = "Death is imminent"
	label.visible = true
	color_rect.visible = true
	
	await get_tree().create_timer(3).timeout  # show for 1.5 seconds
	
	label.visible = false
	color_rect.visible = false
