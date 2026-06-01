extends Control

@onready var file_dialog: FileDialog = $FileDialog
@onready var load_button: Button = $LoadButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect signals
	file_dialog.file_selected.connect(_on_file_selected)
	load_button.pressed.connect(_on_load_pressed)
	
	# Configure the FileDialog object
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	
	# Try to load an image right away
	_on_load_pressed()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# Called when the user starts a new project
func _on_load_pressed() -> void:
	# Show the file explorer for the user to select their image
	file_dialog.popup_centered()

# Called when the user selects their file
func _on_file_selected(path: String) -> void:
	var image_rect: TextureRect = $ImportedImage
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
