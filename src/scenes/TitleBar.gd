extends Node

@onready var new_button : Button = $PanelContainer/MarginContainer/HBoxContainer/NewButton
@onready var open_button : Button = $PanelContainer/MarginContainer/HBoxContainer/OpenButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().new_button.pressed.connect(_new_button_pressed)
	get_tree().open_button.pressed.connect(_open_button_pressed)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
# New button pressed
func _new_button_pressed() -> void:
	#get_tree().change_scene_to_file()
	pass

# Open button pressed
func _open_button_pressed() -> void:
	pass
