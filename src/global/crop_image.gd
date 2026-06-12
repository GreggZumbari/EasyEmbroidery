class_name Global
extends RefCounted

# image = the image to be cropped
# crop_rect = the crop rectangle that the image should be cropped to
# cropped_dims
static func crop_image(image: Image, crop_rect: Rect2i) -> Image:
	
	# Create a new image containing only the crop region
	var cropped = Image.create(
		crop_rect.size.x,
		crop_rect.size.y,
		false,
		image.get_format()
	)

	cropped.blit_rect(
		image,
		crop_rect,
		Vector2i.ZERO
	)

	return cropped
