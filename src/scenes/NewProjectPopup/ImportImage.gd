extends Control

@onready var file_dialog: FileDialog = $FileDialog
@onready var load_button: Button = $BottomEdge/HBoxContainer/LoadButton
@onready var confirm_button: Button = $BottomEdge/HBoxContainer/ConfirmButton
@onready var image_rect: TextureRect = $ImportedImage
@onready var selection_circle: TextureRect = $SelectionCircle

var clicked: bool = false
var hovering: bool = false
var holding: bool = false
var last_click_position: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect signals
	file_dialog.file_selected.connect(_on_file_selected)
	load_button.pressed.connect(_on_load_pressed)
	confirm_button.pressed.connect(_on_confirm_pressed)
	image_rect.mouse_entered.connect(_on_mouse_enter_image)
	image_rect.mouse_exited.connect(_on_mouse_exit_image)
	selection_circle.mouse_entered.connect(_on_mouse_enter_image)
	selection_circle.mouse_exited.connect(_on_mouse_exit_image)
	
	# Configure the FileDialog object
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	
	# Try to load an image right away
	_on_load_pressed()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# If the user is holding down LMB on the image
	if clicked and (hovering or holding):
		# Let the user drag the image around
		var click_position: Vector2 = get_global_mouse_position()
		if not holding:
			holding = true
		else:
			image_rect.position.x -= last_click_position.x - click_position.x
			image_rect.position.y -= last_click_position.y - click_position.y
			
		last_click_position = click_position
	else:
		holding = false
#/Users/Greggory Hickman/Desktop/Borderlands Collecter's Vault 2.0-1

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		# Detect LMB clicks and unclicks
		if event.button_index == 1 and event.pressed:
			clicked = true
		elif event.button_index == 1 and not event.pressed:
			clicked = false
		
		# Detect and handle scroll wheel usage
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			# Zoom in towards the cursor
			var mouse_position: Vector2 = get_global_mouse_position()
			var old_scale = image_rect.scale
			image_rect.scale *= 1.1
			var scale_ratio = image_rect.scale.x / old_scale.x
			image_rect.position = mouse_position - (mouse_position - image_rect.position) * scale_ratio
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			# Zoom out from the cursor
			var mouse_position: Vector2 = get_global_mouse_position()
			var old_scale = image_rect.scale
			image_rect.scale *= 0.9
			var scale_ratio = image_rect.scale.x / old_scale.x
			image_rect.position = mouse_position - (mouse_position - image_rect.position) * scale_ratio

# Called when the user selects their file
func _on_file_selected(path: String) -> void:
	var instructions: RichTextLabel = $LeftEdge/Instructions
	var selection_circle: TextureRect = $SelectionCircle
	
	# Get the image from the path
	var image = Image.new()
	var code = image.load(path)
	
	if code == OK:
		# Show the image on the UI
		var texture = ImageTexture.create_from_image(image)
		image_rect.texture = texture
		
		# Show instructions
		instructions.text = "Please move the desired part of the image into the circle and then press \"Confirm\""
		
		# Show the confirm button and selection circle
		confirm_button.visible = true
		selection_circle.visible = true
	else:
		instructions.text = "Error loading image. Please try again."
		
		# Hide the confirm button and selection circle
		confirm_button.visible = false
		selection_circle.visible = false
		
# Called when the user starts a new project
func _on_load_pressed() -> void:
	# Show the file explorer for the user to select their image
	file_dialog.current_dir = "C:/"
	file_dialog.popup_centered()
	
# Called when the user confirms their selected image
func _on_confirm_pressed() -> void:
	get_tree().change_scene_to_file("res://src/scenes/NewProjectPopup/NewProject.tscn")
		
# Called when the user starts a new project
func _on_mouse_enter_image() -> void:
	hovering = true
	
# Called when the user starts a new project
func _on_mouse_exit_image() -> void:
	hovering = false
