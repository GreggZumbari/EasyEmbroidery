extends Control

@onready var file_dialog: FileDialog = $FileDialog
@onready var load_button: Button = $LoadButton
@onready var image_rect: TextureRect = $CroppedImage/ImportedImage

var hovering: bool = false
var holding: bool = false
var last_click_position: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect signals
	file_dialog.file_selected.connect(_on_file_selected)
	load_button.pressed.connect(_on_load_pressed)
	image_rect.mouse_entered.connect(_on_mouse_enter_image)
	image_rect.mouse_exited.connect(_on_mouse_exit_image)
	
	# Configure the FileDialog object
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	
	# Try to load an image right away
	_on_load_pressed()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# If the user is holding down LMB on the image
	if Input.is_mouse_button_pressed(1) and (hovering or holding):
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

# Called when the user starts a new project
func _on_load_pressed() -> void:
	# Show the file explorer for the user to select their image
	file_dialog.popup_centered()

# Called when the user selects their file
func _on_file_selected(path: String) -> void:
	var instructions: RichTextLabel = $Instructions
	
	# Get the image from the path
	var image = Image.new()
	var code = image.load(path)
	
	if code == OK:
		# Show the image on the UI
		var texture = ImageTexture.create_from_image(image)
		image_rect.texture = texture
	else:
		instructions.text = "Error loading image. Please try again."
		
# Called when the user starts a new project
func _on_mouse_enter_image() -> void:
	hovering = true
	
# Called when the user starts a new project
func _on_mouse_exit_image() -> void:
	hovering = false
