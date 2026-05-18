extends Node

@onready var new_button: Button = $PanelContainer/MarginContainer/HBoxContainer/NewButton
@onready var open_button: Button = $PanelContainer/MarginContainer/HBoxContainer/OpenButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_button.pressed.connect(_new_button_pressed)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
# Called when NewButton is pressed. Creates a new project.
func _new_button_pressed() -> void:
	pass
