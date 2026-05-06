extends Node

var title_bar_width: float = 1280
var title_bar_height: float = 35
var width_height_ratio: float = (1280.0 / 35.0)
var font_size = 18

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().get_root().size_changed.connect(_on_size_changed)
	title_bar_width = get_window().size.x
	font_size = $PanelContainer/MarginContainer/HBoxContainer/NewButton.get_theme_font_size("font_size")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Called when the window size is changed
func _on_size_changed() -> void:
	var ratio = title_bar_width / get_window().size.x
	
	# Change the title bar size
	self.size.y = ratio * title_bar_height
	
	# Change the button size
	var new_button: Button = $PanelContainer/MarginContainer/HBoxContainer/NewButton
	var open_button: Button = $PanelContainer/MarginContainer/HBoxContainer/OpenButton
	
	new_button.add_theme_font_size_override("font_size", font_size * ratio)
	open_button.add_theme_font_size_override("font_size", font_size * ratio)
	
