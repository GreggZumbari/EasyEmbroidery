extends Control

@export var image: Image = null
@onready var project_image: TextureRect = $ProjectImage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_image()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Loads the image defined in this file on the scene
func load_image() -> void:
	if image != null:
		project_image.texture = ImageTexture.create_from_image(image)
