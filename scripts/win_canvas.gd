extends CanvasLayer

@onready var label = $CenterContainer/WinLabel
@onready var color_rect = $ColorRect

func _ready():
	label.visible = false
	color_rect.visible = false

func show_win():
	label.text = "LEVEL COMPLETE! More stages in the future..."
	label.visible = true
	color_rect.visible = true
	
	
