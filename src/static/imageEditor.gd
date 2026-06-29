# This file contains all of the app's static functions related to
# modifying, accessing, loading, or saving images.
# These functions can be called from other files with:
# ImageEditor.function_name()

class_name ImageEditor
extends RefCounted

# Crops an image.
# Inputs:
# 	image = the image to be cropped
# 	crop_rect = the crop rectangle that the image should be cropped to
# Outputs:
# 	Image = the cropped image
static func crop_image(image: Image, crop_rect: Rect2i) -> Image:
	# Create a new image containing only the crop region
	var cropped = Image.create(
		crop_rect.size.x,
		crop_rect.size.y,
		false,
		image.get_format()
	)
	
	# Copy the cropped region into the new image
	cropped.blit_rect(
		image,
		crop_rect,
		Vector2i.ZERO
	)

	return cropped
